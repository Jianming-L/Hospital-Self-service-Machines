using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Hospital_Self_service_Machines
{
    public partial class Hospital_Self_service_MachinesModel : DbContext
    {
        public Hospital_Self_service_MachinesModel()
            : base("name=Hospital_Self_service_MachinesModel")
        {
        }

        public virtual DbSet<User> User { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().ToTable("tb_User")
                .Property(e => e.UserNo)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<User>().ToTable("tb_User")
                .Property(e => e.UserName)
                .IsUnicode(false);
        }
    }
}
