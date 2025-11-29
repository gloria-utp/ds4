using System.Drawing;
using System.Windows.Forms;

namespace Laboratorio13
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            BtnConectarSQL = new Button();
            ListProducts = new ListBox();
            SuspendLayout();
            // 
            // BtnConectarSQL
            // 
            BtnConectarSQL.Location = new Point(242, 74);
            BtnConectarSQL.Name = "BtnConectarSQL";
            BtnConectarSQL.Size = new Size(255, 100);
            BtnConectarSQL.TabIndex = 0;
            BtnConectarSQL.Text = "Conectar y desconectar de SQL Server";
            BtnConectarSQL.UseVisualStyleBackColor = true;
            BtnConectarSQL.Click += BtnConectarSQL_Click;
            // 
            // ListProducts
            // 
            ListProducts.FormattingEnabled = true;
            ListProducts.ItemHeight = 25;
            ListProducts.Location = new Point(242, 207);
            ListProducts.Name = "ListProducts";
            ListProducts.Size = new Size(255, 129);
            ListProducts.TabIndex = 1;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(ListProducts);
            Controls.Add(BtnConectarSQL);
            Name = "Form1";
            Text = "Form1";
            Load += Form1_Load;
            ResumeLayout(false);
        }

        #endregion

        private Button BtnConectarSQL;
        private ListBox ListProducts;
    }
}