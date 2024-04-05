using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace asmtiennuoc
{
    public partial class InstructorIDForm : Form
    {
        private readonly string connectionString;
      

        public InstructorIDForm(string connectionString, DataGridView dataGridView)
        {
            InitializeComponent();
            this.connectionString = connectionString;
            this.dataGridView3 = dataGridView;
            LoadData();
        }
        private void LoadData()
        {
            try
            {
                using (var connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT InstructorID, FirstName, LastName, Department FROM Instructors";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView3.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi khi tải dữ liệu giáo viên: " + ex.Message);
            }
        }


        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
