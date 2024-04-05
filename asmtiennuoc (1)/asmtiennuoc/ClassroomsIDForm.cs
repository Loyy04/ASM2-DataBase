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
    public partial class ClassroomsIDForm : Form
    {
        private readonly string connectionString;
        public ClassroomsIDForm(string connectionString, DataGridView dataGridView)
        {
            InitializeComponent();
            this.connectionString = connectionString;
            this.dataGridView = dataGridView;
            LoadData();
        }
        private void LoadData()
        {
            try
            {
                using (var connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT ClassroomID, Building, RoomNumber, Capacity FROM Classrooms";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi khi tải dữ liệu phòng học: " + ex.Message);
            }
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void ClassroomsIDForm_Load(object sender, EventArgs e)
        {

        }
    }
}
