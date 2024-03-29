USE [estetica_lupita]
GO
/****** Object:  Table [dbo].[auditorias]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditorias](
	[idauditoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](245) NOT NULL,
	[fecha] [varchar](max) NOT NULL,
	[hora] [varchar](max) NOT NULL,
 CONSTRAINT [pk_auditorias] PRIMARY KEY CLUSTERED 
(
	[idauditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[citas]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citas](
	[idcita] [int] IDENTITY(1,1) NOT NULL,
	[ct_empleado] [smallint] NOT NULL,
	[ct_cliente] [smallint] NOT NULL,
	[ct_servicio] [smallint] NOT NULL,
	[ct_cantservicios] [smallint] NOT NULL,
	[ct_fecha] [date] NOT NULL,
	[ct_hora] [time](7) NOT NULL,
	[ct_estatus] [smallint] NOT NULL,
 CONSTRAINT [pk_citas] PRIMARY KEY CLUSTERED 
(
	[idcita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idcliente] [smallint] IDENTITY(1,1) NOT NULL,
	[cl_nombrecompleto] [varchar](45) NOT NULL,
	[cl_telefono] [varchar](10) NOT NULL,
	[cl_sexo] [char](1) NOT NULL,
	[cl_estatus] [smallint] NOT NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[idempleado] [smallint] IDENTITY(1,1) NOT NULL,
	[emp_nombrecompleto] [varchar](45) NOT NULL,
	[emp_telefono] [varchar](10) NOT NULL,
	[emp_sueldo] [decimal](5, 2) NOT NULL,
	[emp_puesto] [smallint] NOT NULL,
	[emp_estatus] [smallint] NOT NULL,
 CONSTRAINT [pk_empleados] PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notaventa]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notaventa](
	[idnotaventa] [int] IDENTITY(1,1) NOT NULL,
	[nv_total] [decimal](5, 2) NOT NULL,
	[nv_cita] [int] NOT NULL,
	[nv_cliente] [smallint] NOT NULL,
	[nv_empleado] [smallint] NOT NULL,
	[nv_estatus] [smallint] NOT NULL,
 CONSTRAINT [pk_notaventa] PRIMARY KEY CLUSTERED 
(
	[idnotaventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notaventa_detalle]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notaventa_detalle](
	[idnotaventa] [int] NOT NULL,
	[nvd_servicio] [smallint] NOT NULL,
	[nvd_precio] [decimal](5, 2) NOT NULL,
	[nvd_cantidad] [smallint] NOT NULL,
	[nvd_estatus] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puestos]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puestos](
	[idpuesto] [smallint] IDENTITY(1,1) NOT NULL,
	[pst_descripcion] [varchar](45) NOT NULL,
	[pst_estatus] [smallint] NOT NULL,
 CONSTRAINT [pk_puestos] PRIMARY KEY CLUSTERED 
(
	[idpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios](
	[idservicio] [smallint] IDENTITY(1,1) NOT NULL,
	[sv_descripcion] [varchar](45) NOT NULL,
	[sv_precio] [decimal](5, 2) NOT NULL,
	[sv_estatus] [smallint] NOT NULL,
 CONSTRAINT [pk_servicios] PRIMARY KEY CLUSTERED 
(
	[idservicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 11/13/2020 10:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario_name] [varchar](45) NOT NULL,
	[usuario_pass] [varchar](45) NOT NULL,
 CONSTRAINT [pk_usuarios] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [fkcliente_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fkcliente_idx] ON [dbo].[citas]
(
	[ct_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fkempleado_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fkempleado_idx] ON [dbo].[citas]
(
	[ct_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fkservicio_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fkservicio_idx] ON [dbo].[citas]
(
	[ct_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fkemppuesto_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fkemppuesto_idx] ON [dbo].[empleados]
(
	[emp_puesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fknotacita_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fknotacita_idx] ON [dbo].[notaventa]
(
	[nv_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fknotacliente_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fknotacliente_idx] ON [dbo].[notaventa]
(
	[nv_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fknotaemp_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fknotaemp_idx] ON [dbo].[notaventa]
(
	[nv_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fknotacnota_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fknotacnota_idx] ON [dbo].[notaventa_detalle]
(
	[idnotaventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fknotavservicio_idx]    Script Date: 11/13/2020 10:23:49 PM ******/
CREATE NONCLUSTERED INDEX [fknotavservicio_idx] ON [dbo].[notaventa_detalle]
(
	[nvd_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[citas] ADD  DEFAULT ((0)) FOR [ct_estatus]
GO
ALTER TABLE [dbo].[clientes] ADD  DEFAULT ((0)) FOR [cl_estatus]
GO
ALTER TABLE [dbo].[empleados] ADD  DEFAULT ((0)) FOR [emp_estatus]
GO
ALTER TABLE [dbo].[notaventa] ADD  DEFAULT ((0)) FOR [nv_estatus]
GO
ALTER TABLE [dbo].[notaventa_detalle] ADD  DEFAULT ((0)) FOR [nvd_estatus]
GO
ALTER TABLE [dbo].[puestos] ADD  DEFAULT ((0)) FOR [pst_estatus]
GO
ALTER TABLE [dbo].[servicios] ADD  DEFAULT ((0)) FOR [sv_estatus]
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD  CONSTRAINT [fkcliente] FOREIGN KEY([ct_cliente])
REFERENCES [dbo].[clientes] ([idcliente])
GO
ALTER TABLE [dbo].[citas] CHECK CONSTRAINT [fkcliente]
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD  CONSTRAINT [fkempleado] FOREIGN KEY([ct_empleado])
REFERENCES [dbo].[empleados] ([idempleado])
GO
ALTER TABLE [dbo].[citas] CHECK CONSTRAINT [fkempleado]
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD  CONSTRAINT [fkservicio] FOREIGN KEY([ct_servicio])
REFERENCES [dbo].[servicios] ([idservicio])
GO
ALTER TABLE [dbo].[citas] CHECK CONSTRAINT [fkservicio]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [fkemppuesto] FOREIGN KEY([emp_puesto])
REFERENCES [dbo].[puestos] ([idpuesto])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [fkemppuesto]
GO
ALTER TABLE [dbo].[notaventa]  WITH CHECK ADD  CONSTRAINT [fknotacita] FOREIGN KEY([nv_cita])
REFERENCES [dbo].[citas] ([idcita])
GO
ALTER TABLE [dbo].[notaventa] CHECK CONSTRAINT [fknotacita]
GO
ALTER TABLE [dbo].[notaventa]  WITH CHECK ADD  CONSTRAINT [fknotacliente] FOREIGN KEY([nv_cliente])
REFERENCES [dbo].[clientes] ([idcliente])
GO
ALTER TABLE [dbo].[notaventa] CHECK CONSTRAINT [fknotacliente]
GO
ALTER TABLE [dbo].[notaventa]  WITH CHECK ADD  CONSTRAINT [fknotaemp] FOREIGN KEY([nv_empleado])
REFERENCES [dbo].[empleados] ([idempleado])
GO
ALTER TABLE [dbo].[notaventa] CHECK CONSTRAINT [fknotaemp]
GO
ALTER TABLE [dbo].[notaventa_detalle]  WITH CHECK ADD  CONSTRAINT [fknotacnota] FOREIGN KEY([idnotaventa])
REFERENCES [dbo].[notaventa] ([idnotaventa])
GO
ALTER TABLE [dbo].[notaventa_detalle] CHECK CONSTRAINT [fknotacnota]
GO
ALTER TABLE [dbo].[notaventa_detalle]  WITH CHECK ADD  CONSTRAINT [fknotavservicio] FOREIGN KEY([nvd_servicio])
REFERENCES [dbo].[servicios] ([idservicio])
GO
ALTER TABLE [dbo].[notaventa_detalle] CHECK CONSTRAINT [fknotavservicio]
GO
USE [master]
GO
ALTER DATABASE [estetica_lupita] SET  READ_WRITE 
GO
