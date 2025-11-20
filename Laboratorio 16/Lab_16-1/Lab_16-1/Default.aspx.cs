using System;

namespace Lab_16_1
{
    public partial class Default : System.Web.UI.Page
    {
        static double firstNumber = 0;
        static string currentOperator = "";
        static bool newOperation = true;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Number_Click(object sender, EventArgs e)
        {
            if (newOperation)
            {
                txtDisplay.Text = "";
                newOperation = false;
            }

            string number = ((System.Web.UI.WebControls.Button)sender).Text;
            txtDisplay.Text += number;
        }

        protected void Operator_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtDisplay.Text))
            {
                firstNumber = Convert.ToDouble(txtDisplay.Text);
                currentOperator = ((System.Web.UI.WebControls.Button)sender).Text;
                txtDisplay.Text = currentOperator;
                newOperation = true;
            }
        }

        protected void btnEquals_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(currentOperator) && !newOperation)
            {
                double secondNumber = Convert.ToDouble(txtDisplay.Text);
                double result = 0;

                switch (currentOperator)
                {
                    case "+":
                        result = firstNumber + secondNumber;
                        break;
                    case "-":
                        result = firstNumber - secondNumber;
                        break;
                    case "*":
                        result = firstNumber * secondNumber;
                        break;
                    case "/":
                        if (secondNumber != 0)
                            result = firstNumber / secondNumber;
                        else
                            txtDisplay.Text = "Error";
                        break;
                }

                if (txtDisplay.Text != "Error")
                {
                    txtDisplay.Text = result.ToString();
                    firstNumber = result;
                }

                currentOperator = "";
                newOperation = true;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = "";
            firstNumber = 0;
            currentOperator = "";
            newOperation = true;
        }
    }
}