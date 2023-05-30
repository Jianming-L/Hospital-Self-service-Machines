using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hospital_Self_service_Machines.DataAccessLayer
{
    public interface IUserDal
    {
        User Select(string userNo);
    }
}
