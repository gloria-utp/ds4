namespace Laboratorio123
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblLadoA = new System.Windows.Forms.Label();
            this.lblLadoB = new System.Windows.Forms.Label();
            this.lblLadoC = new System.Windows.Forms.Label();
            this.lblSemiperimetro = new System.Windows.Forms.Label();
            this.lblArea = new System.Windows.Forms.Label();
            this.txtLadoA = new System.Windows.Forms.TextBox();
            this.txtLadoB = new System.Windows.Forms.TextBox();
            this.txtLadoC = new System.Windows.Forms.TextBox();
            this.txtSemiperimetro = new System.Windows.Forms.TextBox();
            this.txtArea = new System.Windows.Forms.TextBox();
            this.btnSemiperimetro = new System.Windows.Forms.Button();
            this.btnArea = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnSalida = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblLadoA
            // 
            this.lblLadoA.AutoSize = true;
            this.lblLadoA.Location = new System.Drawing.Point(101, 36);
            this.lblLadoA.Name = "lblLadoA";
            this.lblLadoA.Size = new System.Drawing.Size(213, 20);
            this.lblLadoA.TabIndex = 0;
            this.lblLadoA.Text = "Ingrese la longitud del lado A";
            // 
            // lblLadoB
            // 
            this.lblLadoB.AutoSize = true;
            this.lblLadoB.Location = new System.Drawing.Point(101, 95);
            this.lblLadoB.Name = "lblLadoB";
            this.lblLadoB.Size = new System.Drawing.Size(213, 20);
            this.lblLadoB.TabIndex = 1;
            this.lblLadoB.Text = "Ingrese la longitud del lado B";
            // 
            // lblLadoC
            // 
            this.lblLadoC.AutoSize = true;
            this.lblLadoC.Location = new System.Drawing.Point(101, 156);
            this.lblLadoC.Name = "lblLadoC";
            this.lblLadoC.Size = new System.Drawing.Size(213, 20);
            this.lblLadoC.TabIndex = 2;
            this.lblLadoC.Text = "Ingrese la longitud del lado C";
            // 
            // lblSemiperimetro
            // 
            this.lblSemiperimetro.AutoSize = true;
            this.lblSemiperimetro.Location = new System.Drawing.Point(101, 279);
            this.lblSemiperimetro.Name = "lblSemiperimetro";
            this.lblSemiperimetro.Size = new System.Drawing.Size(173, 20);
            this.lblSemiperimetro.TabIndex = 3;
            this.lblSemiperimetro.Text = "Calcular Semiperimetro";
            // 
            // lblArea
            // 
            this.lblArea.AutoSize = true;
            this.lblArea.Location = new System.Drawing.Point(101, 343);
            this.lblArea.Name = "lblArea";
            this.lblArea.Size = new System.Drawing.Size(137, 20);
            this.lblArea.TabIndex = 4;
            this.lblArea.Text = "Area del Triangulo";
            // 
            // txtLadoA
            // 
            this.txtLadoA.Location = new System.Drawing.Point(373, 36);
            this.txtLadoA.Name = "txtLadoA";
            this.txtLadoA.Size = new System.Drawing.Size(100, 26);
            this.txtLadoA.TabIndex = 5;
            // 
            // txtLadoB
            // 
            this.txtLadoB.Location = new System.Drawing.Point(373, 95);
            this.txtLadoB.Name = "txtLadoB";
            this.txtLadoB.Size = new System.Drawing.Size(100, 26);
            this.txtLadoB.TabIndex = 6;
            // 
            // txtLadoC
            // 
            this.txtLadoC.Location = new System.Drawing.Point(373, 156);
            this.txtLadoC.Name = "txtLadoC";
            this.txtLadoC.Size = new System.Drawing.Size(100, 26);
            this.txtLadoC.TabIndex = 7;
            // 
            // txtSemiperimetro
            // 
            this.txtSemiperimetro.Location = new System.Drawing.Point(373, 279);
            this.txtSemiperimetro.Name = "txtSemiperimetro";
            this.txtSemiperimetro.Size = new System.Drawing.Size(100, 26);
            this.txtSemiperimetro.TabIndex = 8;
            // 
            // txtArea
            // 
            this.txtArea.Location = new System.Drawing.Point(373, 343);
            this.txtArea.Name = "txtArea";
            this.txtArea.Size = new System.Drawing.Size(100, 26);
            this.txtArea.TabIndex = 9;
            // 
            // btnSemiperimetro
            // 
            this.btnSemiperimetro.Location = new System.Drawing.Point(105, 215);
            this.btnSemiperimetro.Name = "btnSemiperimetro";
            this.btnSemiperimetro.Size = new System.Drawing.Size(150, 40);
            this.btnSemiperimetro.TabIndex = 10;
            this.btnSemiperimetro.Text = "Semiperimetro";
            this.btnSemiperimetro.UseVisualStyleBackColor = true;
            this.btnSemiperimetro.Click += new System.EventHandler(this.btnSemiperimetro_Click);
            // 
            // btnArea
            // 
            this.btnArea.Location = new System.Drawing.Point(261, 215);
            this.btnArea.Name = "btnArea";
            this.btnArea.Size = new System.Drawing.Size(150, 40);
            this.btnArea.TabIndex = 11;
            this.btnArea.Text = "Area";
            this.btnArea.UseVisualStyleBackColor = true;
            this.btnArea.Click += new System.EventHandler(this.btnArea_Click);
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(417, 215);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(150, 40);
            this.btnReset.TabIndex = 12;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnSalida
            // 
            this.btnSalida.Location = new System.Drawing.Point(573, 215);
            this.btnSalida.Name = "btnSalida";
            this.btnSalida.Size = new System.Drawing.Size(150, 40);
            this.btnSalida.TabIndex = 13;
            this.btnSalida.Text = "Salida";
            this.btnSalida.UseVisualStyleBackColor = true;
            this.btnSalida.Click += new System.EventHandler(this.btnSalida_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnSalida);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.btnArea);
            this.Controls.Add(this.btnSemiperimetro);
            this.Controls.Add(this.txtArea);
            this.Controls.Add(this.txtSemiperimetro);
            this.Controls.Add(this.txtLadoC);
            this.Controls.Add(this.txtLadoB);
            this.Controls.Add(this.txtLadoA);
            this.Controls.Add(this.lblArea);
            this.Controls.Add(this.lblSemiperimetro);
            this.Controls.Add(this.lblLadoC);
            this.Controls.Add(this.lblLadoB);
            this.Controls.Add(this.lblLadoA);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblLadoA;
        private System.Windows.Forms.Label lblLadoB;
        private System.Windows.Forms.Label lblLadoC;
        private System.Windows.Forms.Label lblSemiperimetro;
        private System.Windows.Forms.Label lblArea;
        private System.Windows.Forms.TextBox txtLadoA;
        private System.Windows.Forms.TextBox txtLadoB;
        private System.Windows.Forms.TextBox txtLadoC;
        private System.Windows.Forms.TextBox txtSemiperimetro;
        private System.Windows.Forms.TextBox txtArea;
        private System.Windows.Forms.Button btnSemiperimetro;
        private System.Windows.Forms.Button btnArea;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnSalida;
    }
}