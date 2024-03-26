/*
 * https://metanit.com/sharp/efcore/2.2.php но там ошибки!
 */

using Microsoft.EntityFrameworkCore;

public record User(int Id, string? Name, int Age, int S);

public class ApplicationContext : DbContext
{
    public DbSet<User> Users => Set<User>();
    public ApplicationContext() => Database.EnsureCreated();

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlite("Data Source=helloapp.db");
    }
}


internal class Program
{
    private static void Main(string[] args)
    {
        //Console.WriteLine("Hello, World!");
        using ApplicationContext db = new ApplicationContext();
        // создаем два объекта User
        User tom = new(3, "Tom", 33, 1);
        User alice = new(4, "Alice", 26, 2);

        // добавляем их в бд
        db.Users.Add(tom);
        db.Users.Add(alice);
        db.SaveChanges();
        Console.WriteLine("Объекты успешно сохранены");

        // получаем объекты из бд и выводим на консоль
        var users = db.Users.ToList();
        Console.WriteLine("Список объектов:");
        foreach (User u in users)
        {
            Console.WriteLine($"{u.Id}.{u.Name} - {u.Age}");
        }
    }
}