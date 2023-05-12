namespace Hospital_Self_service_Machines
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [Key]
        [StringLength(10)]
        public string UserNo { get; set; }

        [Required]
        [StringLength(10)]
        public string UserName { get; set; }

        [Required]
        [MaxLength(20)]
        public byte[] Password { get; set; }

        public bool IsActivated { get; set; }

        public int LoginFailCount { get; set; }
    }
}
