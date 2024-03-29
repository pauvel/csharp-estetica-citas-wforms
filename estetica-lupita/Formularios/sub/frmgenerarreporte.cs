﻿using Controladores;
using Modelos;
using Modelos.EF;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using estetica_lupita.Reportes;

namespace estetica_lupita.Formularios.sub
{
    public partial class frmgenerarreporte : Form
    {
        public frmgenerarreporte()
        {
            InitializeComponent();
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            if (rbtntodas.Checked)
            {
                this.button1.Enabled = false;
                var vtCtrl = new ventaController();
                var ventas = await vtCtrl.obtenerPorFechas(this.dateTimePicker1.Value, this.dateTimePicker2.Value);
                var notaventas = ventas.Select(venta => venta.NotaVenta).ToList();
                this.button1.Enabled = true;
                generarReporte(notaventas, "reporte de solo ventas");
            }

            if (rbtncliente.Checked)
            {
                using(var pickCl = new utilidades.frm_cliente_picker())
                {
                    var result = pickCl.ShowDialog();
                    if(result == DialogResult.Yes)
                    {
                        var cliente = pickCl.Cliente;
                        var r = MessageBox.Show(
                            $"Generar reporte en base las ventas hechas al cliente {cliente.cl_nombrecompleto} ?",
                            "Confirmar",
                            MessageBoxButtons.YesNo,
                            MessageBoxIcon.Question);
                        if (r == DialogResult.No) return;
                        this.button1.Enabled = false;
                        var vtCtrl = new ventaController();
                        var ventas = await vtCtrl.obtenerPorCliente(this.dateTimePicker1.Value, this.dateTimePicker2.Value, cliente.idcliente);
                        var notaventas = ventas.Select(venta => venta.NotaVenta).ToList();
                        this.button1.Enabled = true;
                        generarReporte(notaventas, "reporte por cliente");
                    }
                    else
                    {
                        MessageBox.Show("Para generar este reporte necesita seleccionar un cliente.");
                    }
                }
            }

            if (rbtnempelado.Checked)
            {
                using(var pickCl = new utilidades.frm_empleado_picker())
                {
                    var result = pickCl.ShowDialog();
                    if(result == DialogResult.Yes)
                    {
                        var empelado = pickCl.Empleado;
                        var r = MessageBox.Show(
                            $"Generar reporte en base las ventas hechas por el empleado {empelado.NombreCompleto} ?",
                            "Confirmar",
                            MessageBoxButtons.YesNo,
                            MessageBoxIcon.Question);
                        if (r == DialogResult.No) return;
                        this.button1.Enabled = false;
                        var vtCtrl = new ventaController();
                        var ventas = await vtCtrl.obtenerPorEmpleado(this.dateTimePicker1.Value, this.dateTimePicker2.Value, empelado.Id);
                        var notaventas = ventas.Select(venta => venta.NotaVenta).ToList();
                        this.button1.Enabled = true;
                        generarReporte(notaventas, "reporte por empleado");
                    }
                    else
                    {
                        MessageBox.Show("Para generar este reporte necesita seleccionar un cliente.");
                    }
                }
            }

        }

        private void generarReporte(List<notaventaModel> notaventas, String tipoReporte)
        {
            using (var rptventas = new frmreporteventas(notaventas, this.dateTimePicker1.Value, this.dateTimePicker2.Value, tipoReporte))
            {
                rptventas.ShowDialog();
            }
        }
    }
}
