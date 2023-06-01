namespace Hospital_Self_service_Machines
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DoctorInfo
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string DoctorNo { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string DoctorName { get; set; }

        public int? DepartmentDetailNo { get; set; }

        public int? WorkWeekday { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(20)]
        public string WorkTime { get; set; }
    }
}
