namespace Laboratorio14
{
    partial class FrmProductos
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmProductos));
            this.label1 = new System.Windows.Forms.Label();
            this.tstId = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtPrecio = new System.Windows.Forms.TextBox();
            this.txtStock = new System.Windows.Forms.TextBox();
            this.btnSalir = new System.Windows.Forms.Button();
            this.tsbBuscar = new System.Windows.Forms.PictureBox();
            this.tsbNuevo = new System.Windows.Forms.PictureBox();
            this.tsbGuardar = new System.Windows.Forms.PictureBox();
            this.tsbEliminar = new System.Windows.Forms.PictureBox();
            this.tsbCancelar = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.tsbBuscar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbNuevo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbGuardar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbEliminar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbCancelar)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(172, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Buscar por id";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // tstId
            // 
            this.tstId.Location = new System.Drawing.Point(269, 9);
            this.tstId.Name = "tstId";
            this.tstId.Size = new System.Drawing.Size(100, 22);
            this.tstId.TabIndex = 1;
            this.tstId.TextChanged += new System.EventHandler(this.tstId_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(27, 78);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(18, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "Id";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(30, 117);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(100, 22);
            this.txtId.TabIndex = 3;
            this.txtId.TextChanged += new System.EventHandler(this.txtId_TextChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(172, 78);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(56, 16);
            this.label3.TabIndex = 4;
            this.label3.Text = "Nombre";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(175, 117);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(349, 22);
            this.txtNombre.TabIndex = 5;
            this.txtNombre.TextChanged += new System.EventHandler(this.txtNombre_TextChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(33, 184);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(46, 16);
            this.label4.TabIndex = 6;
            this.label4.Text = "Precio";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(172, 184);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(41, 16);
            this.label5.TabIndex = 7;
            this.label5.Text = "Stock";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // txtPrecio
            // 
            this.txtPrecio.Location = new System.Drawing.Point(36, 224);
            this.txtPrecio.Name = "txtPrecio";
            this.txtPrecio.Size = new System.Drawing.Size(100, 22);
            this.txtPrecio.TabIndex = 8;
            this.txtPrecio.TextChanged += new System.EventHandler(this.txtPrecio_TextChanged);
            // 
            // txtStock
            // 
            this.txtStock.Location = new System.Drawing.Point(175, 224);
            this.txtStock.Name = "txtStock";
            this.txtStock.Size = new System.Drawing.Size(100, 22);
            this.txtStock.TabIndex = 9;
            this.txtStock.TextChanged += new System.EventHandler(this.txtStock_TextChanged);
            // 
            // btnSalir
            // 
            this.btnSalir.Location = new System.Drawing.Point(36, 331);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(75, 23);
            this.btnSalir.TabIndex = 10;
            this.btnSalir.Text = "Salir";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
            // 
            // tsbBuscar
            // 
            this.tsbBuscar.ErrorImage = null;
            this.tsbBuscar.Image = ((System.Drawing.Image)(resources.GetObject("tsbBuscar.Image")));
            this.tsbBuscar.Location = new System.Drawing.Point(375, 9);
            this.tsbBuscar.Name = "tsbBuscar";
            this.tsbBuscar.Size = new System.Drawing.Size(34, 22);
            this.tsbBuscar.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.tsbBuscar.TabIndex = 16;
            this.tsbBuscar.TabStop = false;
            this.tsbBuscar.Click += new System.EventHandler(this.tsbBuscar_Click);
            // 
            // tsbNuevo
            // 
            this.tsbNuevo.Image = ((System.Drawing.Image)(resources.GetObject("tsbNuevo.Image")));
            this.tsbNuevo.Location = new System.Drawing.Point(13, 9);
            this.tsbNuevo.Name = "tsbNuevo";
            this.tsbNuevo.Size = new System.Drawing.Size(32, 22);
            this.tsbNuevo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.tsbNuevo.TabIndex = 17;
            this.tsbNuevo.TabStop = false;
            this.tsbNuevo.Click += new System.EventHandler(this.tbsNuevo_Click);
            // 
            // tsbGuardar
            // 
            this.tsbGuardar.Image = ((System.Drawing.Image)(resources.GetObject("tsbGuardar.Image")));
            this.tsbGuardar.Location = new System.Drawing.Point(51, 9);
            this.tsbGuardar.Name = "tsbGuardar";
            this.tsbGuardar.Size = new System.Drawing.Size(28, 22);
            this.tsbGuardar.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.tsbGuardar.TabIndex = 18;
            this.tsbGuardar.TabStop = false;
            this.tsbGuardar.Click += new System.EventHandler(this.tbsGuardar_Click);
            // 
            // tsbEliminar
            // 
            this.tsbEliminar.Image = ((System.Drawing.Image)(resources.GetObject("tsbEliminar.Image")));
            this.tsbEliminar.Location = new System.Drawing.Point(123, 9);
            this.tsbEliminar.Name = "tsbEliminar";
            this.tsbEliminar.Size = new System.Drawing.Size(24, 22);
            this.tsbEliminar.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.tsbEliminar.TabIndex = 19;
            this.tsbEliminar.TabStop = false;
            this.tsbEliminar.Click += new System.EventHandler(this.tbsEliminar_Click);
            // 
            // tsbCancelar
            // 
            this.tsbCancelar.Image = ((System.Drawing.Image)(resources.GetObject("tsbCancelar.Image")));
            this.tsbCancelar.Location = new System.Drawing.Point(84, 9);
            this.tsbCancelar.Name = "tsbCancelar";
            this.tsbCancelar.Size = new System.Drawing.Size(33, 22);
            this.tsbCancelar.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.tsbCancelar.TabIndex = 20;
            this.tsbCancelar.TabStop = false;
            this.tsbCancelar.Click += new System.EventHandler(this.tbsCancelar_Click);
            // 
            // FrmProductos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tsbCancelar);
            this.Controls.Add(this.tsbEliminar);
            this.Controls.Add(this.tsbGuardar);
            this.Controls.Add(this.tsbNuevo);
            this.Controls.Add(this.tsbBuscar);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.txtStock);
            this.Controls.Add(this.txtPrecio);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtNombre);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tstId);
            this.Controls.Add(this.label1);
            this.Name = "FrmProductos";
            this.Text = "Productos";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.tsbBuscar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbNuevo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbGuardar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbEliminar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tsbCancelar)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tstId;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtPrecio;
        private System.Windows.Forms.TextBox txtStock;
        private System.Windows.Forms.Button btnSalir;
        private System.Windows.Forms.PictureBox tsbBuscar;
        private System.Windows.Forms.PictureBox tsbNuevo;
        private System.Windows.Forms.PictureBox tsbGuardar;
        private System.Windows.Forms.PictureBox tsbEliminar;
        private System.Windows.Forms.PictureBox tsbCancelar;
        private System.Windows.Forms.Label label2;
    }
}

