using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Hospital_Self_service_Machines
{
    public partial class DoctorNameFindModel : DbContext
    {
        public DoctorNameFindModel()
            : base("name=DoctorNameFindModel")
        {
        }

        public virtual DbSet<DepartmentDetail> DepartmentDetail { get; set; }
        public virtual DbSet<DoctorInfo> DoctorInfo { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DepartmentDetail>().ToTable("tb_DepartmentDetail");
            modelBuilder.Entity<DoctorInfo>().ToTable("tb_DoctorInfo");
            modelBuilder.Entity<DepartmentDetail>()
                .Property(e => e.DepartmentDetailName)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorInfo>()
                .Property(e => e.DoctorNo)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DoctorInfo>()
                .Property(e => e.DoctorName)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DoctorInfo>()
                .Property(e => e.WorkTime)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
