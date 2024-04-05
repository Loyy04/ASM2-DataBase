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
    public partial class MainForm : Form
    {
        private readonly string connectionString = "Data Source=LOYY;Initial Catalog=\"ASM 1\";Integrated Security=True;Encrypt=False";
        private SqlConnection connection;
        private SqlDataAdapter dataAdapter;
        private DataTable dataTable;
        

        public MainForm()
        {
            InitializeComponent();
            InitializeDatabase();   
            this.connectionString = connectionString;
        }

        

        private void InitializeDatabase()
        {
            connection = new SqlConnection(connectionString);
            dataAdapter = new SqlDataAdapter("SELECT * FROM Schedules", connection);
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);
            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
        }
        private void LoadData()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = @"SELECT S.ScheduleID, I.InstructorID, C.CourseID, C.CourseName, CL.ClassroomID, S.StartTime, S.EndTime, S.DayOfWeek
                                     FROM Schedules S
                                     LEFT JOIN Instructors I ON S.InstructorID = I.InstructorID
                                     LEFT JOIN Courses C ON S.CourseID = C.CourseID
                                     LEFT JOIN Classrooms CL ON S.ClassroomID = CL.ClassroomID";
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi khi tải dữ liệu lịch trình: " + ex.Message);
            }
        }
        private void buttonAdd_Click(object sender, EventArgs e)
        {
            // Lấy dữ liệu từ các TextBox
            string field1 = textBox1.Text;
            string field2 = textBox2.Text;
            string field3 = textBox3.Text;
            string field4 = textBox4.Text;
            string field5 = textBox5.Text;
            string field6 = textBox6.Text;
            string field7 = textBox7.Text;

            // Thêm dữ liệu vào DataTable
            DataRow newRow = dataTable.NewRow();
            newRow["ScheduleID"] = field1;
            newRow["CourseID"] = field2;
            newRow["InstructorID"] = field3;
            newRow["ClassroomID"] = field4;
            newRow["StartTime"] = field5;
            newRow["EndTime"] = field6;
            newRow["DayOfWeek"] = field7;
            dataTable.Rows.Add(newRow);


            dataAdapter.Update(dataTable);
        }

        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            // Kiểm tra xem có dòng nào được chọn không
            if (dataGridView.SelectedRows.Count > 0)
            {
                // Lấy dữ liệu từ các TextBox
                string field1 = textBox1.Text;
                string field2 = textBox2.Text;
                string field3 = textBox3.Text;
                string field4 = textBox4.Text;
                string field5 = textBox5.Text;
                string field6 = textBox6.Text;
                string field7 = textBox7.Text;

                // Lấy chỉ số của dòng được chọn trong DataGridView
                int rowIndex = dataGridView.SelectedRows[0].Index;

                // Cập nhật dữ liệu trong DataTable
                dataTable.Rows[rowIndex]["ScheduleID"] = field1;
                dataTable.Rows[rowIndex]["CourseID"] = field2;
                dataTable.Rows[rowIndex]["InstructorID"] = field3;
                dataTable.Rows[rowIndex]["ClassroomID"] = field4;
                dataTable.Rows[rowIndex]["StartTime"] = field5;
                dataTable.Rows[rowIndex]["EndTime"] = field6;
                dataTable.Rows[rowIndex]["DayOfWeek"] = field7;

                dataAdapter.Update(dataTable);
            }
        }
        private void buttonDelete_Click(object sender, EventArgs e)
        {
            FormDelete formDelete = new FormDelete();
            formDelete.ShowDialog();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void btnShowCourses_Click(object sender, EventArgs e)
        {
            CourseIDForm courseIDForm = new CourseIDForm(connectionString, dataGridView);

        }

        private void btnShowInstructors_Click(object sender, EventArgs e)
        {
            InstructorIDForm instructorIDForm = new InstructorIDForm(connectionString, dataGridView);
        }

        private void btnShowClassrooms_Click(object sender, EventArgs e)
        {
            ClassroomsIDForm classroomsIDForm = new ClassroomsIDForm(connectionString, dataGridView);
        }

        private void btnShowSchedules_Click(object sender, EventArgs e)
        {
            SchedulesIDForm schedulesIDForm = new SchedulesIDForm(connectionString,dataGridView);
        }

        private void btnExit_Click(object sender, EventArgs e)

        {
           DialogResult result = MessageBox.Show("You Want To Exit?", "Exit", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) ;
            if  (result == DialogResult.Yes)
            {
                Application.Exit();
            }

        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }
    }
}


