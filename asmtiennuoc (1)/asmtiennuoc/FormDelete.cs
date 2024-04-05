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
    public partial class FormDelete : Form
    {
        private readonly string connectionString = "Data Source=LOYY;Initial Catalog=\"ASM 1\";Integrated Security=True;Encrypt=False";
        public FormDelete()
        {
            InitializeComponent();
        }
        private void FormDelete_Load(object sender, EventArgs e)
        {
            LoadDataIntoDataGridView();
        }
        private void LoadDataIntoDataGridView()
        {
            try
            {
                string query = "SELECT * FROM Schedules"; 

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView.SelectedRows.Count > 0)
                {
                    int selectedIndex = dataGridView.SelectedRows[0].Index;
                    int scheduleID = Convert.ToInt32(dataGridView.Rows[selectedIndex].Cells["ScheduleID"].Value);

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = "DELETE FROM Schedules WHERE ScheduleID = @ScheduleID";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@ScheduleID", scheduleID);
                        int result = command.ExecuteNonQuery();

                        if (result == 1)
                        {
                            MessageBox.Show("ScheduleID deleted successfully.");
                            LoadDataIntoDataGridView(); // Load lại dữ liệu sau khi xóa
                        }
                        else
                        {
                            MessageBox.Show("Failed to delete schedule.");
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Please select a row to delete.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
