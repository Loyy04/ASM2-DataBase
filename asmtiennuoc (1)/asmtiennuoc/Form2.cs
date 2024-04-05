using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace asmtiennuoc
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        public string Username { get; set; }
        private void buttonLogin_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("You want to exit?", "Exit", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
            {
                Application.Exit();
            }
        }
        public delegate void OnLoginSuccess(string username);

        public OnLoginSuccess OnLoginSuccessEvent;
        private void buttonExit_Click(object sender, EventArgs e)
        {
            
            

            string username = textBoxUsername.Text;
            string password = textBoxPassword.Text;
            if (username == "admin" || password == "123@123a")
            {
                MessageBox.Show("Login Success");
                
                MainForm mainForm = new MainForm();
                mainForm.Show();
                this.Hide(); 
            }
            else
            {
                MessageBox.Show("Login Fail");
            }
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void Form2_Load_1(object sender, EventArgs e)
        {

        }
    }
}
