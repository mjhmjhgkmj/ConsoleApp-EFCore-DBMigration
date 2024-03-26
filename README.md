# ConsoleApp-EFCore-DBMigration

установите пакеты nuget 
скомпилируйте
добавьте или измените поля в 

public record User(int Id, string? Name, int Age, int S);

далее:
Visual Studio - средства - диспетчер пакетов - консоль дтспетчера пакетов,
вводите команды
> Add-Migration <migration_name>

если ошибка то провить текущий путь в консоли и перейти в папку проекта (имя папки начинается на c) - для каких то команд это критично
> dir

> cd c* (или cd ConsoleApp-EFCore-DBMigration)

применить изменения к тестовой БД
Update-Database

создать sql для прода - там накоплены все изменения (странно, мну нужно только последнее)
dotnet ef migrations script --output migration_prod_N.sql

