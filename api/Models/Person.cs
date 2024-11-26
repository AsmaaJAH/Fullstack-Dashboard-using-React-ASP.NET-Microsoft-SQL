namespace zcportal.Models
{
    public class Person
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; } 
        public int isAdmin { get; set; }
    }
}
