namespace Hospital_Self_service_Machines
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DepartmentDetail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int DepartmentDetailNo { get; set; }

        [Required]
        [StringLength(40)]
        public string DepartmentDetailName { get; set; }

        public int DepartmentNo { get; set; }
    }
}
