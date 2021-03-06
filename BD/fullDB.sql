USE [AD2016]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/26/2016 1:57:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[TipoCliente] [char](1) NOT NULL,
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Cuit] [varchar](50) NULL,
	[RazonSocial] [varchar](50) NULL,
	[Apellido] [varchar](200) NULL,
	[Dni] [varchar](8) NULL,
	[Nombre] [varchar](100) NULL,
	[IdDireccion] [int] NULL,
	[IdCuentaCorriente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CondicionesEspecialesVehiculo]    Script Date: 10/26/2016 1:57:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CondicionesEspecialesVehiculo](
	[IdCondicionesEspecialesVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[IdVehiculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCondicionesEspecialesVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coordenada]    Script Date: 10/26/2016 1:57:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coordenada](
	[IdCoordenada] [int] IDENTITY(1,1) NOT NULL,
	[Latitud] [varchar](255) NOT NULL,
	[Longitud] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCoordenada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CuentaCorriente]    Script Date: 10/26/2016 1:57:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CuentaCorriente](
	[IdCtaCte] [int] IDENTITY(1,1) NOT NULL,
	[Credito] [float] NOT NULL,
	[FormaPago] [varchar](255) NULL,
	[LimiteCredito] [float] NOT NULL,
	[IdCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCtaCte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 10/26/2016 1:57:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](100) NOT NULL,
	[codigoPostal] [int] NOT NULL,
	[Localidad] [varchar](100) NOT NULL,
	[Nro] [int] NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdProvincia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encomienda]    Script Date: 10/26/2016 1:57:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encomienda](
	[IdEncomienda] [int] IDENTITY(1,1) NOT NULL,
	[Alto] [float] NULL,
	[Ancho] [float] NULL,
	[ApellidoReceptor] [varchar](100) NOT NULL,
	[Apilable] [bit] NULL,
	[CantApilable] [smallint] NULL,
	[CargaGranel] [varchar](100) NULL,
	[CondicionTransporte] [varchar](50) NULL,
	[DniReceptor] [varchar](8) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaEstimadaEntrega] [datetime] NULL,
	[Fragilidad] [varchar](20) NULL,
	[IndicacionesManipulacion] [varchar](1000) NULL,
	[Internacional] [bit] NULL,
	[Largo] [float] NULL,
	[NombreReceptor] [varchar](100) NOT NULL,
	[Peso] [float] NULL,
	[Refrigerado] [bit] NULL,
	[ServicioSeguridad] [varbinary](255) NULL,
	[Tercerizado] [bit] NOT NULL,
	[EsTerciarizado] [bit] NULL,
	[TipoEncomienda] [varchar](2) NOT NULL,
	[Tratamiento] [varchar](50) NULL,
	[UnidadGranel] [varchar](25) NULL,
	[Volumen] [float] NULL,
	[VolumenGranel] [float] NULL,
	[IdCliente] [int] NOT NULL,
	[IdDireccionDestino] [int] NULL,
	[IdDireccionOrigen] [int] NULL,
	[IdSucursalActual] [int] NULL,
	[IdSucursalDestino] [int] NOT NULL,
	[IdSucursalOrigen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEncomienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EncomiendaEnvio]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncomiendaEnvio](
	[idEnvio] [int] NOT NULL,
	[idEncomienda] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Envio]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Envio](
	[IdEnvio] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[FechaLlegadaEstimada] [datetime] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[NroTracking] [int] NULL,
	[Propio] [bit] NOT NULL,
	[IdMapaDeRuta] [int] NULL,
	[IdCoordenadaActual] [int] NOT NULL,
	[IdProveedor] [int] NULL,
	[IdSucursalDestino] [int] NOT NULL,
	[IdSucursalOrigen] [int] NOT NULL,
	[vehiculo_IdVehiculo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FechaVencimiento] [datetime] NULL,
	[Pagada] [bit] NOT NULL,
	[TipoFactura] [varchar](1) NOT NULL,
	[Vencimiento] [datetime] NOT NULL,
	[IdCtaCte] [int] NULL,
	[IdEncomienda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemFactura]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemFactura](
	[IdItemFactura] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Valor] [float] NOT NULL,
	[IdFactura] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdItemFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemManifiesto]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemManifiesto](
	[IdItemManifiesto] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[IdManifiesto] [int] NULL,
	[IdProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdItemManifiesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemRemito]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemRemito](
	[IdItemFactura] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[IdProducto] [int] NULL,
	[IdRemito] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdItemFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manifiesto]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manifiesto](
	[IdManifiesto] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdEncomienda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdManifiesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MapaDeRuta]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapaDeRuta](
	[IdMapaDeRuta] [int] IDENTITY(1,1) NOT NULL,
	[CantKm] [float] NULL,
	[costo] [float] NULL,
	[Duracion] [float] NULL,
	[IdSucursalDestino] [int] NULL,
	[IdSucursalOrigen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMapaDeRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MapaDeRutaCoordenada]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapaDeRutaCoordenada](
	[IdMapaDeRuta] [int] NOT NULL,
	[IdCoordenada] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlanMantenimiento]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlanMantenimiento](
	[IdPlanMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[Comentarios] [varchar](255) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPlanMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](255) NULL,
	[CodigoProducto] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Unidad] [char](1) NOT NULL,
	[IdCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductoEncomienda]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoEncomienda](
	[IdProductoEncomienda] [int] IDENTITY(1,1) NOT NULL,
	[IdEncomienda] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProductoEncomienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Activo] [varchar](1) NOT NULL,
	[Cuit] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[RazonSocial] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[IdDireccion] [int] NULL,
	[EsTallerOficial] [bit] NULL,
	[Tipo] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[IdPais] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Remito]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Remito](
	[IdRemito] [int] IDENTITY(1,1) NOT NULL,
	[ApellidoReceptor] [varchar](100) NOT NULL,
	[CondicionTransporte] [varchar](255) NULL,
	[Conformado] [bit] NOT NULL,
	[DniReceptor] [varchar](8) NOT NULL,
	[FechaConformado] [datetime] NOT NULL,
	[FechaEstimadaEntrega] [datetime] NULL,
	[IndicacionesManipulacion] [varchar](255) NULL,
	[NombreReceptor] [varchar](100) NOT NULL,
	[IdEncomienda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRemito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seguro]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seguro](
	[Descripcion] [varchar](255) NULL,
	[Tarifa] [float] NULL,
	[TarifaPorKm] [float] NULL,
	[TipoSeguro] [varchar](255) NULL,
	[idProveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServicioSeguridad]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServicioSeguridad](
	[Descripcion] [varchar](255) NULL,
	[Tarifa] [float] NULL,
	[idProveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Telefono] [varchar](255) NULL,
	[Coordenada] [int] NULL,
	[IdDireccion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TareaMantenimiento]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TareaMantenimiento](
	[Tipo] [char](1) NOT NULL,
	[IdTareaMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[Tarea] [varchar](255) NOT NULL,
	[CantidadKilometros] [float] NULL,
	[CantidadDias] [int] NULL,
	[IdPlanMantenimiento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTareaMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TareaMantenimientoRealizada]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TareaMantenimientoRealizada](
	[IdTareaMantenimientoRealizada] [int] IDENTITY(1,1) NOT NULL,
	[CantidadKilometros] [float] NULL,
	[FechaRealizada] [datetime] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdTareaMantenimiento] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTareaMantenimientoRealizada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TarifasCarrier]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TarifasCarrier](
	[IdTarifasCarrier] [int] IDENTITY(1,1) NOT NULL,
	[Comentarios] [varchar](255) NULL,
	[PrecioKMExtra] [float] NULL,
	[Prioridad] [varchar](255) NULL,
	[Tarifa] [float] NULL,
	[idProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTarifasCarrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Dni] [varchar](8) NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Password] [varchar](255) NULL,
	[UltimoAcceso] [datetime] NULL,
	[usuario] [varchar](255) NULL,
	[IdSucursal] [int] NULL,
	[IdRolUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioRol]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRol](
	[Usuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 10/26/2016 1:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[IdVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[Alto] [float] NULL,
	[Ancho] [float] NULL,
	[Anio] [varchar](255) NOT NULL,
	[CondicionTransporte] [varchar](50) NULL,
	[Estado] [varchar](255) NULL,
	[KmRecorridos] [float] NOT NULL,
	[Largo] [float] NULL,
	[Marca] [varchar](100) NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[Patente] [varchar](15) NOT NULL,
	[Peso] [float] NULL,
	[Refrigerado] [bit] NULL,
	[Tara] [float] NOT NULL,
	[Volumen] [float] NULL,
	[IdPlanMantenimiento] [int] NULL,
	[idSucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_5jy3irhw05qxk9hn2ju64fsip] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_5jy3irhw05qxk9hn2ju64fsip]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_qs7ssl7d86bfgexbktnekqntc] FOREIGN KEY([IdCuentaCorriente])
REFERENCES [dbo].[CuentaCorriente] ([IdCtaCte])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_qs7ssl7d86bfgexbktnekqntc]
GO
ALTER TABLE [dbo].[CondicionesEspecialesVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_jk7l79lybvcbxiacj6793ba7x] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[CondicionesEspecialesVehiculo] CHECK CONSTRAINT [FK_jk7l79lybvcbxiacj6793ba7x]
GO
ALTER TABLE [dbo].[CuentaCorriente]  WITH CHECK ADD  CONSTRAINT [FK_p3q634oqli6wlvhe61xip39jf] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[CuentaCorriente] CHECK CONSTRAINT [FK_p3q634oqli6wlvhe61xip39jf]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_jr58si85nf07txqjf2epuhleb] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_jr58si85nf07txqjf2epuhleb]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_mhrj7tnuxp2ryclmtdi1hfgge] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_mhrj7tnuxp2ryclmtdi1hfgge]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_2m8bu2xqrrub3sp73xb5o57y9] FOREIGN KEY([IdSucursalDestino])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_2m8bu2xqrrub3sp73xb5o57y9]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_2pj86q8exi5ccco4wfqlh5shs] FOREIGN KEY([IdDireccionOrigen])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_2pj86q8exi5ccco4wfqlh5shs]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_61obb82luusx9y5d9thxd3ynt] FOREIGN KEY([IdSucursalActual])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_61obb82luusx9y5d9thxd3ynt]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_dha138ls5i6ce973ffnp4l9u4] FOREIGN KEY([IdSucursalOrigen])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_dha138ls5i6ce973ffnp4l9u4]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_e8bgxppwiw6p7b3d97dnjq3j9] FOREIGN KEY([IdDireccionDestino])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_e8bgxppwiw6p7b3d97dnjq3j9]
GO
ALTER TABLE [dbo].[Encomienda]  WITH CHECK ADD  CONSTRAINT [FK_mm5y5jydlhj3x3xoph11quol1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Encomienda] CHECK CONSTRAINT [FK_mm5y5jydlhj3x3xoph11quol1]
GO
ALTER TABLE [dbo].[EncomiendaEnvio]  WITH CHECK ADD  CONSTRAINT [FK_6caxxdlre7aep6hiiky3y3eeq] FOREIGN KEY([idEnvio])
REFERENCES [dbo].[Envio] ([IdEnvio])
GO
ALTER TABLE [dbo].[EncomiendaEnvio] CHECK CONSTRAINT [FK_6caxxdlre7aep6hiiky3y3eeq]
GO
ALTER TABLE [dbo].[EncomiendaEnvio]  WITH CHECK ADD  CONSTRAINT [FK_b9bcu95f3f670b7fk6q5edmne] FOREIGN KEY([idEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[EncomiendaEnvio] CHECK CONSTRAINT [FK_b9bcu95f3f670b7fk6q5edmne]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_6ie4obmme5gkbr31v55t7qlu7] FOREIGN KEY([IdMapaDeRuta])
REFERENCES [dbo].[MapaDeRuta] ([IdMapaDeRuta])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_6ie4obmme5gkbr31v55t7qlu7]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_6u7ie99rj9flnm7eqk32daqq4] FOREIGN KEY([IdSucursalOrigen])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_6u7ie99rj9flnm7eqk32daqq4]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_9jgq3c8erfcsvgkfocn60k1jb] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_9jgq3c8erfcsvgkfocn60k1jb]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_faulvsugk9d0y3ja9ey7jdb2k] FOREIGN KEY([IdSucursalDestino])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_faulvsugk9d0y3ja9ey7jdb2k]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_q9ukvvakhy5t5c75iaigkg2ho] FOREIGN KEY([IdCoordenadaActual])
REFERENCES [dbo].[Coordenada] ([IdCoordenada])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_q9ukvvakhy5t5c75iaigkg2ho]
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_qyb1jjjt6ggg4l87b87s104pe] FOREIGN KEY([vehiculo_IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_qyb1jjjt6ggg4l87b87s104pe]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_938cujxvkgjd25tpjd2dk7csc] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_938cujxvkgjd25tpjd2dk7csc]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_jfeia8o9g46k5hql71xfdbsj0] FOREIGN KEY([IdCtaCte])
REFERENCES [dbo].[CuentaCorriente] ([IdCtaCte])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_jfeia8o9g46k5hql71xfdbsj0]
GO
ALTER TABLE [dbo].[ItemFactura]  WITH CHECK ADD  CONSTRAINT [FK_nhm0tq2t4ebmgs3xo10mdyfsv] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[ItemFactura] CHECK CONSTRAINT [FK_nhm0tq2t4ebmgs3xo10mdyfsv]
GO
ALTER TABLE [dbo].[ItemManifiesto]  WITH CHECK ADD  CONSTRAINT [FK_4jsasu4gsrshs8xmhj393w5u] FOREIGN KEY([IdManifiesto])
REFERENCES [dbo].[Manifiesto] ([IdManifiesto])
GO
ALTER TABLE [dbo].[ItemManifiesto] CHECK CONSTRAINT [FK_4jsasu4gsrshs8xmhj393w5u]
GO
ALTER TABLE [dbo].[ItemManifiesto]  WITH CHECK ADD  CONSTRAINT [FK_ikuc9domwvqr25xab2tpeebi9] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ItemManifiesto] CHECK CONSTRAINT [FK_ikuc9domwvqr25xab2tpeebi9]
GO
ALTER TABLE [dbo].[ItemRemito]  WITH CHECK ADD  CONSTRAINT [FK_56fu6a58bhnipm65f15e84ejf] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ItemRemito] CHECK CONSTRAINT [FK_56fu6a58bhnipm65f15e84ejf]
GO
ALTER TABLE [dbo].[ItemRemito]  WITH CHECK ADD  CONSTRAINT [FK_5pp2fyjbwvkxd4r5bqk2s6w5e] FOREIGN KEY([IdRemito])
REFERENCES [dbo].[Remito] ([IdRemito])
GO
ALTER TABLE [dbo].[ItemRemito] CHECK CONSTRAINT [FK_5pp2fyjbwvkxd4r5bqk2s6w5e]
GO
ALTER TABLE [dbo].[Manifiesto]  WITH CHECK ADD  CONSTRAINT [FK_cgtv27tsonxit0n382sa8p8kq] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[Manifiesto] CHECK CONSTRAINT [FK_cgtv27tsonxit0n382sa8p8kq]
GO
ALTER TABLE [dbo].[MapaDeRuta]  WITH CHECK ADD  CONSTRAINT [FK_3cu85ladlcpv6rykllmwfq60t] FOREIGN KEY([IdSucursalOrigen])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[MapaDeRuta] CHECK CONSTRAINT [FK_3cu85ladlcpv6rykllmwfq60t]
GO
ALTER TABLE [dbo].[MapaDeRuta]  WITH CHECK ADD  CONSTRAINT [FK_tr0a7wnpwachf46d3ecxvmrtm] FOREIGN KEY([IdSucursalDestino])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[MapaDeRuta] CHECK CONSTRAINT [FK_tr0a7wnpwachf46d3ecxvmrtm]
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada]  WITH CHECK ADD  CONSTRAINT [FK_60hyv30fs2urepyusiayo6kol] FOREIGN KEY([IdCoordenada])
REFERENCES [dbo].[Coordenada] ([IdCoordenada])
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada] CHECK CONSTRAINT [FK_60hyv30fs2urepyusiayo6kol]
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada]  WITH CHECK ADD  CONSTRAINT [FK_ewu2f5oq8or79f49ns6gdufm1] FOREIGN KEY([IdMapaDeRuta])
REFERENCES [dbo].[MapaDeRuta] ([IdMapaDeRuta])
GO
ALTER TABLE [dbo].[MapaDeRutaCoordenada] CHECK CONSTRAINT [FK_ewu2f5oq8or79f49ns6gdufm1]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_ilamvx9jfcjgc34mj9je3li5k] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_ilamvx9jfcjgc34mj9je3li5k]
GO
ALTER TABLE [dbo].[ProductoEncomienda]  WITH CHECK ADD  CONSTRAINT [FK_jsk9wjgb26hyvnvn11cgu1699] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ProductoEncomienda] CHECK CONSTRAINT [FK_jsk9wjgb26hyvnvn11cgu1699]
GO
ALTER TABLE [dbo].[ProductoEncomienda]  WITH CHECK ADD  CONSTRAINT [FK_t1glhweh5g9jeoc2o12r64vqw] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[ProductoEncomienda] CHECK CONSTRAINT [FK_t1glhweh5g9jeoc2o12r64vqw]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_l17061vp55k68ipl68nk06vp9] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_l17061vp55k68ipl68nk06vp9]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_ffhq7ncsu2euj1snx5hhcu0ye] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_ffhq7ncsu2euj1snx5hhcu0ye]
GO
ALTER TABLE [dbo].[Remito]  WITH CHECK ADD  CONSTRAINT [FK_r2jsj721vp5i0fxmhjoghk3mj] FOREIGN KEY([IdEncomienda])
REFERENCES [dbo].[Encomienda] ([IdEncomienda])
GO
ALTER TABLE [dbo].[Remito] CHECK CONSTRAINT [FK_r2jsj721vp5i0fxmhjoghk3mj]
GO
ALTER TABLE [dbo].[Seguro]  WITH CHECK ADD  CONSTRAINT [FK_24w5n0gpq4pxym4ln48j4fvy0] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Seguro] CHECK CONSTRAINT [FK_24w5n0gpq4pxym4ln48j4fvy0]
GO
ALTER TABLE [dbo].[ServicioSeguridad]  WITH CHECK ADD  CONSTRAINT [FK_882he748eg9fqika0um1e7skf] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[ServicioSeguridad] CHECK CONSTRAINT [FK_882he748eg9fqika0um1e7skf]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_28itdo6e3nj2ghytuyx6jv66b] FOREIGN KEY([Coordenada])
REFERENCES [dbo].[Coordenada] ([IdCoordenada])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_28itdo6e3nj2ghytuyx6jv66b]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_m4qcqa6av7n12ntu0txu0yfyp] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_m4qcqa6av7n12ntu0txu0yfyp]
GO
ALTER TABLE [dbo].[TareaMantenimiento]  WITH CHECK ADD  CONSTRAINT [FK_32iwbokk6q935dturganj4eoa] FOREIGN KEY([IdPlanMantenimiento])
REFERENCES [dbo].[PlanMantenimiento] ([IdPlanMantenimiento])
GO
ALTER TABLE [dbo].[TareaMantenimiento] CHECK CONSTRAINT [FK_32iwbokk6q935dturganj4eoa]
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada]  WITH CHECK ADD  CONSTRAINT [FK_2nq6ugyu5knhh3mhxjinm7lri] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada] CHECK CONSTRAINT [FK_2nq6ugyu5knhh3mhxjinm7lri]
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada]  WITH CHECK ADD  CONSTRAINT [FK_mu5jbyxp3rb6wu3lgdlg5ejvw] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada] CHECK CONSTRAINT [FK_mu5jbyxp3rb6wu3lgdlg5ejvw]
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada]  WITH CHECK ADD  CONSTRAINT [FK_o48kw5irdxe24sanxrh4ru2bb] FOREIGN KEY([IdTareaMantenimiento])
REFERENCES [dbo].[TareaMantenimiento] ([IdTareaMantenimiento])
GO
ALTER TABLE [dbo].[TareaMantenimientoRealizada] CHECK CONSTRAINT [FK_o48kw5irdxe24sanxrh4ru2bb]
GO
ALTER TABLE [dbo].[TarifasCarrier]  WITH CHECK ADD  CONSTRAINT [FK_a46tc6uwpnkdyjkxajc8sgy34] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[TarifasCarrier] CHECK CONSTRAINT [FK_a46tc6uwpnkdyjkxajc8sgy34]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_jfihpoxeop2l4bf65gncda72f] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_jfihpoxeop2l4bf65gncda72f]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_pqiw1hsuxr1xeboev5o9laqgw] FOREIGN KEY([IdRolUsuario])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_pqiw1hsuxr1xeboev5o9laqgw]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_7pak6cvbpyi3obxjoo70jqdfr] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_7pak6cvbpyi3obxjoo70jqdfr]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_qyadlqm26qwv2fm3rdhoamfgn] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_qyadlqm26qwv2fm3rdhoamfgn]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_9w89rmqpg9qi9m8wo06847omg] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_9w89rmqpg9qi9m8wo06847omg]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_kf5umanbe19gjqcunrolrtxqq] FOREIGN KEY([IdPlanMantenimiento])
REFERENCES [dbo].[PlanMantenimiento] ([IdPlanMantenimiento])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_kf5umanbe19gjqcunrolrtxqq]
GO
