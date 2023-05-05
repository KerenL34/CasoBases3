
-- Creacion de TVP
CREATE TYPE TDriver AS TABLE
(
    name Varchar(25),
    lastName Varchar(40),
    countryId int,
    isActive bit
)


DROP PROCEDURE IF EXISTS [dbo].[spDesactivarDriver] 
GO
-----------------------------------------------------------
-- Autor: Joctan Esquivel y Keren Fuentes
-- Fecha: 2023/05/2


CREATE PROCEDURE [dbo].[spDesactivarDriver]
    @pDrivers TDriver READONLY
AS 
BEGIN
    SET NOCOUNT ON -- no retorne metadatos
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT


    -- declaracion de otras variables
    -- operaciones de select que no tengan que ser bloqueadas
    -- tratar de hacer todo lo posible antes de q inice la transaccion
    SET @InicieTransaccion = 0
    IF @@TRANCOUNT=0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION
    END
    BEGIN TRY
        SET @CustomError = 53000

        UPDATE Drivers
        SET Drivers.isActive = 0
        FROM Drivers 
        INNER JOIN @pDrivers drivUpd
        ON drivUpd.name = Drivers.name
        WHERE drivUpd.lastName = Drivers.LastName


        IF @InicieTransaccion=1 BEGIN
            COMMIT
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE()
        SET @Message = ERROR_MESSAGE()

        IF @InicieTransaccion=1 BEGIN
            ROLLBACK
        END
        RAISERROR('%s - Error Number: %i', 
            @ErrorSeverity, @ErrorState, @Message, @CustomError)
    END CATCH
END
RETURN 0
GO