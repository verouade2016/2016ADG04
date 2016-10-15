package com.ADG04.Servidor;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.hibernate.type.descriptor.java.UUIDTypeDescriptor.ToStringTransformer;

import com.ADG04.Negocio.GestionAdministracion;
import com.ADG04.Negocio.GestionCliente;
import com.ADG04.Negocio.GestionControlViajes;
import com.ADG04.Negocio.GestionEncomienda;
import com.ADG04.Negocio.GestionVehiculo;
import com.ADG04.Servidor.dao.CoordenadaDao;
import com.ADG04.Servidor.dao.DireccionDao;
import com.ADG04.Servidor.dao.EncomiendaDao;
import com.ADG04.Servidor.dao.EnvioDao;
import com.ADG04.Servidor.dao.MapaDeRutaDao;
import com.ADG04.Servidor.dao.PaisDao;
import com.ADG04.Servidor.dao.PlanMantenimientoDao;
import com.ADG04.Servidor.dao.ProductoDao;
import com.ADG04.Servidor.dao.ProvinciaDao;
import com.ADG04.Servidor.dao.SucursalDao;
import com.ADG04.Servidor.dao.VehiculoDao;
import com.ADG04.Servidor.model.Cliente;
import com.ADG04.Servidor.model.Coordenada;
import com.ADG04.Servidor.model.Direccion;
import com.ADG04.Servidor.model.Encomienda;
import com.ADG04.Servidor.model.Envio;
import com.ADG04.Servidor.model.MapaDeRuta;
import com.ADG04.Servidor.model.Pais;
import com.ADG04.Servidor.model.Provincia;
import com.ADG04.Servidor.model.Sucursal;
import com.ADG04.Servidor.model.TareaMantenimientoPorKm;
import com.ADG04.Servidor.model.Vehiculo;
import com.ADG04.Servidor.util.EntityManagerProvider;
import com.ADG04.Servidor.util.EnvioEstado;
import com.ADG04.bean.Administracion.DTO_Direccion;
import com.ADG04.bean.Administracion.DTO_Pais;
import com.ADG04.bean.Administracion.DTO_Provincia;
import com.ADG04.bean.Administracion.DTO_Sucursal;
import com.ADG04.bean.Administracion.DTO_Usuario;
import com.ADG04.bean.Cliente.DTO_ClienteParticular;
import com.ADG04.bean.Cliente.DTO_Producto;
import com.ADG04.bean.Encomienda.DTO_EncomiendaParticular;
import com.ADG04.bean.Encomienda.DTO_ItemManifiesto;
import com.ADG04.bean.Encomienda.DTO_ItemRemito;
import com.ADG04.bean.Encomienda.DTO_Manifiesto;
import com.ADG04.bean.Encomienda.DTO_Remito;
import com.ADG04.bean.Vehiculo.DTO_PlanMantenimiento;
import com.ADG04.bean.Vehiculo.DTO_TareaMantenimiento;
import com.ADG04.bean.Vehiculo.DTO_TareaMantenimientoRealizada;
import com.ADG04.bean.Vehiculo.DTO_TareasPorKilometro;
import com.ADG04.bean.Vehiculo.DTO_TareasPorTiempo;
import com.ADG04.bean.Vehiculo.DTO_Vehiculo;



/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	//TestTareasVencidas();
    	
    	//TestRealizarTareaPorKm();
    	//TestRealizarTareaPorTiempo();
    	//generarVehiculoTest("Mercedez Benz", "Camion1", "2010", "AAA001",1);   	
    	//generarVehiculoTest("Mercedez Benz", "Camion2", "2011", "AAA002",2);
    	//generarVehiculoTest("Mercedez Benz", "Camion3", "2012", "AAA003",1);
    	//generarVehiculoTest("Mercedez Benz", "Camion4", "2013", "AAA004",2);
    	
    	//TestCrearPlanesYTareas();
    	
    	//TestGetPlanes();    	
    	//crearPaisesYProvincias();
    	//TestAltaCliente();
    	//testControlViajes();
    	//TestEncomienda();
    	testAsignarEnvios();
    	//TestFacturaEncomiendaParticular();
    	
    	//TestSucursal("Sucursal Origen");
    	//TestSucursal("Sucursal Destino");
    	
 //   	TestPaisDao();
    //	TestUsuario();
    }
    
    private static void TestTareasVencidas(){
    	PlanMantenimientoDao.getInstancia().getTareasVencidasPorTiempo(6);
    }
    
    private static void TestCrearPlanesYTareas(){
    	int idPm = TestAddPlanMantenimiento("Mantenimiento de un Mercedes 1");
    	TestAddTareasToPlan("Cambiar ruedas 1", 123, "Cambiar aceite 1", 230,idPm);
    	idPm = TestAddPlanMantenimiento("Mantenimiento de un Mercedes 2");
    	TestAddTareasToPlan("Cambiar ruedas 2", 678, "Cambiar aceite 2", 1230,idPm);
    }
    
    private static void TestGetPlanes() {

    	int idVehiculo = 6;
    	DTO_PlanMantenimiento planDTO = GestionVehiculo.getInstancia().getPlanByVehiculo(idVehiculo);
    	System.out.println(planDTO.getDescripcion());
    	System.out.println("------------------------------------------------------------");
    	System.out.println("------------------------------------------------------------");
    	System.out.println("Plan de mantenimiento del vehiculo " + idVehiculo);
    	System.out.println(planDTO.getDescripcion());
    	System.out.println(planDTO.getId());
    	
    	System.out.println("------------------------------------------------------------");
    	System.out.println("Tareas por KMs:");
    	for(DTO_TareasPorKilometro t:planDTO.getTareasPorKM()){
    		System.out.println(t.getTarea());
    		System.out.println(t.getCantidadKilometros());
    		System.out.println(t.getId());
    	}
    	System.out.println("------------------------------------------------------------");
    	System.out.println("Tareas por Tiempo:");
    	for(DTO_TareasPorTiempo t:planDTO.getTareasPorTiempo()){
    		System.out.println(t.getTarea());
    		System.out.println(t.getCantidadDias());
    		System.out.println(t.getId());
    	}
    	
    	System.out.println("------------------------------------------------------------");
    	System.out.println("------------------------------------------------------------");
	}

	private static void crearPaisesYProvincias(){
    	DTO_Pais pais = new DTO_Pais();
    	pais.setDescripcion("Argentina");
    	GestionAdministracion.getInstancia().altaPais(pais);
    	
    	DTO_Provincia prov = new DTO_Provincia();
    	prov.setDescripcion("Mendoza");
    	prov.setPais(PaisDao.getInstancia().getById(1).toDTO());
    	GestionAdministracion.getInstancia().altaProvincia(prov);
    	
    	prov.setDescripcion("Cordoba");
    	prov.setPais(PaisDao.getInstancia().getById(1).toDTO());
    	GestionAdministracion.getInstancia().altaProvincia(prov);
    	
    	pais.setDescripcion("Peru");
    	GestionAdministracion.getInstancia().altaPais(pais);
    }
    /**
     * Alta de 1 plan de mantenimiento, con una tarea de km y una por tiempo.
     */
    private static int TestAddPlanMantenimiento(String descPlan) {
		
    	DTO_PlanMantenimiento pm = new DTO_PlanMantenimiento();
    	pm.setComentarios("Comentarios: " + descPlan);
    	pm.setDescripcion(descPlan);
    	pm.setTolerancia(123);
    	
    	int idPm = GestionVehiculo.getInstancia().altaPlanMantenimiento(pm);
    	System.out.println("Plan nro " + idPm + " creado.");
    	return idPm;
	}
    
    private static void TestAddTareasToPlan(String tareaKm, float kms, String tareaTiempo, int dias, int idPlanMantenimiento){

    	DTO_TareasPorKilometro tareaXKM = new DTO_TareasPorKilometro();
    	tareaXKM.setCantidadKilometros(kms);
    	tareaXKM.setIdPlanMantenimiento(idPlanMantenimiento);
    	tareaXKM.setTarea(tareaKm);
    	
    	GestionVehiculo.getInstancia().altaTareaMantenimiento(tareaXKM);
    	
    	DTO_TareasPorTiempo tareaXTiempo = new DTO_TareasPorTiempo();
    	tareaXTiempo.setCantidadDias(dias);
    	tareaXTiempo.setIdPlanMantenimiento(idPlanMantenimiento);
    	tareaXTiempo.setTarea(tareaTiempo);
    	int idTarea = GestionVehiculo.getInstancia().altaTareaMantenimiento(tareaXTiempo);
    }

    private static void TestRealizarTareaPorKm(){

    	int idVehiculo = 3;
    	int idProveedor = 1;
    	int idTarea = 3;
    	
    	DTO_TareaMantenimientoRealizada tRealizada = new DTO_TareaMantenimientoRealizada();
    	tRealizada.setFecha(new Date());
    	tRealizada.setIdProveedor(idProveedor);
    	tRealizada.setIdVehiculo(idVehiculo);
    	tRealizada.setIdTareaMantenimiento(idTarea);
    	GestionVehiculo.getInstancia().realizarTareaMantenimiento(tRealizada);
    }
    
    private static void TestRealizarTareaPorTiempo(){

    	int idVehiculo = 3;
    	int idProveedor = 1;
    	int idTarea = 4;
    	
    	DTO_TareaMantenimientoRealizada tRealizada = new DTO_TareaMantenimientoRealizada();
    	tRealizada.setFecha(new Date());
    	tRealizada.setIdProveedor(idProveedor);
    	tRealizada.setIdVehiculo(idVehiculo);
    	tRealizada.setIdTareaMantenimiento(idTarea);
    	GestionVehiculo.getInstancia().realizarTareaMantenimiento(tRealizada);
    }

    
	private static void TestAltaCliente() {  	
    	DTO_Direccion dir = new DTO_Direccion();
    	
    	Pais pais = (Pais) PaisDao.getInstancia().getById(1);
    	Provincia prov = (Provincia) ProvinciaDao.getInstancia().getById(1);
    	
    	dir.setCalle("Una calle");
    	dir.setCodigoPostal(1234);
    	dir.setLocalidad("Capital Federal");
    	dir.setNro(123);
    	dir.setPais(pais.toDTO());
    	dir.setProvincia(prov.toDTO());
    	
    	DTO_ClienteParticular cliParticular = new DTO_ClienteParticular();
    	
    	cliParticular.setApellido("Guccione");
    	cliParticular.setDni("32437264");
		cliParticular.setEmail("vguccione@gmail.com");
		cliParticular.setEstado(true);
		cliParticular.setNombre("Vanesa");
		cliParticular.setTelefono("1556932544");
		cliParticular.setDireccion(dir);
		
		GestionCliente.getInstancia().altaClienteParticular(cliParticular);
    }

	public static void TestUsuario(){
    	DTO_Usuario usuario = new DTO_Usuario();
    	usuario.setApellido("Pepe");
    	usuario.setDni("212328");
    	usuario.setFechaCreacion(new Date());
    	usuario.setNombre("pepepe");
    	usuario.setPassword("xxxxxx");
    	usuario.setUltimoAcceso(new Date());
    	usuario.setIdSucursal(1);
    	usuario.setIdRolUsuario(1);
    	
    	GestionAdministracion.getInstancia().altaUsuario(usuario);
    }
    
	public static void TestSucursal(String descripcion){
		
		DTO_Direccion dir = new DTO_Direccion();
    	DTO_Sucursal sucursal = new DTO_Sucursal();
    	Pais pais = (Pais) PaisDao.getInstancia().getById(1);
    	Provincia prov = (Provincia) ProvinciaDao.getInstancia().getById(1);
    	
    	dir.setCalle("peperulo calle");
    	dir.setCodigoPostal(1234);
    	dir.setLocalidad("Capital Federal");
    	dir.setNro(123);
    	dir.setPais(pais.toDTO());
    	dir.setProvincia(prov.toDTO());
    	
    	sucursal.setDescripcion(descripcion);
    	sucursal.setTelefono("123456");
    	sucursal.setDireccion(dir);
    	    	
    	GestionAdministracion.getInstancia().altaSucursal(sucursal);
    }
		
	public static void TestFacturaEncomiendaParticular(){
		
		System.out.println("---------------TestFacturaEncomiendaParticular--------------------");
		
		GestionEncomienda.getInstancia().facturarEncomiendaParticular(1);

		System.out.println("Id de Factura generada:");
		int idFactura = GestionEncomienda.getInstancia().getFacturaParticularByIdEncomienda(1);
		System.out.println(idFactura);
		
		System.out.println("-------------------------------------------------------------------");
	}
	
	public static void TestEncomienda(){
		
		float nro = 123;
		DTO_ClienteParticular cli = new DTO_ClienteParticular();
		cli.setId(1);
    	DTO_Sucursal sucursalOrigen = SucursalDao.getInstancia().getById(1).toDTO();
    	DTO_Sucursal sucursalDestino = SucursalDao.getInstancia().getById(2).toDTO();
    	
    	DTO_EncomiendaParticular encomienda = new DTO_EncomiendaParticular();

		encomienda.setCliente(cli);
		encomienda.setSucursalOrigen(sucursalOrigen);
		encomienda.setSucursalDestino(sucursalDestino);
		encomienda.setLargo(nro);
		encomienda.setAncho(nro);
		
		encomienda.setAlto(12.0f);
		encomienda.setPeso(430f);
		encomienda.setVolumen(44.5f);
		encomienda.setTratamiento("nada"); 
		encomienda.setApilable(true);
		encomienda.setCantApilable((short)2); 
		encomienda.setRefrigerado(false);
		encomienda.setCondicionTransporte(null); 
		encomienda.setIndicacionesManipulacion(null);
		encomienda.setFragilidad("no"); 
		encomienda.setNombreReceptor("Alfredo"); 
		encomienda.setApellidoReceptor("Receptor");
		encomienda.setDniReceptor("99876543"); 
		encomienda.setVolumenGranel(0f); 
		encomienda.setUnidadGranel(null);
		encomienda.setCargaGranel(null);		
		
		DTO_Manifiesto manifiesto = new DTO_Manifiesto();
		manifiesto.setFecha(new Date());
		List<DTO_ItemManifiesto>items = new ArrayList<DTO_ItemManifiesto>();
		DTO_ItemManifiesto item = new DTO_ItemManifiesto();
		item.setCantidad(10);
		item.setDescripcion("hola que tal ");
		DTO_Producto producto = ProductoDao.getInstancia().getById(1).toDTO();
		item.setProducto(producto);
		
		items.add(item);
		manifiesto.setDetalle(items);
		encomienda.setManifiesto(manifiesto);
		
		
		DTO_Remito remito = new DTO_Remito();
		remito.setApellidoReceptor("Apellido receptor");
		remito.setNombreReceptor("Nombre receptor");
		remito.setDniReceptor("12312321");
		remito.setConformado(false);
		remito.setFecha(new Date());
		remito.setFechaEstimadaEntrega(new Date());
		remito.setCondicionTransporte(encomienda.getCondicionTransporte());
		remito.setIndicacionesManipulacion(encomienda.getIndicacionesManipulacion());
		
		List<DTO_ItemRemito>itemsr = new ArrayList<DTO_ItemRemito>();
		DTO_ItemRemito itemr = new DTO_ItemRemito();
		item.setCantidad(10);
		item.setDescripcion("hola que tal remito");
		DTO_Producto productor = ProductoDao.getInstancia().getById(1).toDTO();
		itemr.setCantidad(10);
		itemr.setProducto(productor);
		itemr.setRemito(remito);
		itemsr.add(itemr);
		remito.setDetalle(itemsr);
		
		encomienda.setRemito(remito);
		
    	GestionEncomienda.getInstancia().altaEncomiendaParticular(encomienda);
    }
    
	public static void generarVehiculoTest(String marca, String modelo, String anio, String patente, int idPm){
		
		//buscar el plan
			
		//Creo vehiculo
		DTO_Vehiculo v = new DTO_Vehiculo();
		v.setAlto(100f);
		v.setAncho(100f);
		v.setAnio(anio);
		v.setEstado(null);
		v.setKmsRecorridos(13400);
		v.setLargo(1000f);
		v.setMarca(marca);
		v.setModelo(modelo);
		v.setPatente(patente);
		v.setPeso(560f);
		v.setTara(20);	
		v.setRefrigerado(false);
		v.setVolumen(3333f);
		v.setFechaIngreso(new Date(2016,01,01));
		
		DTO_PlanMantenimiento plan = new DTO_PlanMantenimiento();
		plan.setId(idPm);
		v.setPlanMantenimiento(plan);
		
		DTO_Sucursal su  = new DTO_Sucursal();
		su.setId(1);
		v.setSucursal(su);
		
		GestionVehiculo.getInstancia().altaVehiculo(v);
		
	}
	
	public static void testControlViajes(){	
		EntityManager em = EntityManagerProvider.getInstance().getEntityManagerFactory().createEntityManager();
		EntityTransaction tx = em.getTransaction();
		
		//Creo vehiculo
		tx.begin();
		Vehiculo v = new Vehiculo();
		v.setAlto(100f);
		v.setAncho(100f);
		v.setAnio("2016");
		v.setEstado("");
		v.setKmRecorridos(1000);
		v.setLargo(1000f);
		v.setMarca("Ford");
		v.setModelo("Ka");
		v.setPatente("ADJ000");
		v.setPeso(560f);
		v.setTara(20);	
		v.setRefrigerado(false);
		v.setVolumen(3333f);
		
		VehiculoDao.getInstancia().persist(v);	
		tx.commit();
		
		//Creo sucursal origen
		tx.begin();
		
		Direccion dirOrigen = new Direccion();
		dirOrigen.setCalle("Calle a");
		dirOrigen.setCodigoPostal(123);
		dirOrigen.setLocalidad("localidad");
		dirOrigen.setNro(123);
		dirOrigen.setPais(PaisDao.getInstancia().getById(1));
		dirOrigen.setProvincia(ProvinciaDao.getInstancia().getById(1));
		
		Sucursal so = new Sucursal();
		so.setDescripcion("A");
		so.setTelefono("767676767");
		so.setDireccion(dirOrigen);
		
		SucursalDao.getInstancia().persist(so);
		tx.commit();	
		
		//Creo Sucursal destino
		tx.begin();

		Direccion dirDestino = new Direccion();
		dirDestino.setCalle("Calle bbb");
		dirDestino.setCodigoPostal(123);
		dirDestino.setLocalidad("localidad");
		dirDestino.setNro(123);
		dirDestino.setPais(PaisDao.getInstancia().getById(1));
		dirDestino.setProvincia(ProvinciaDao.getInstancia().getById(2));
		
		Sucursal sd = new Sucursal();
		sd.setDescripcion("B");
		sd.setTelefono("34343");
		sd.setDireccion(dirDestino);
		
		SucursalDao.getInstancia().persist(sd);
		tx.commit();	
		
		//Creo lista de coordenadas para asociar a un mapa de rutas
		
		List<Coordenada> listaCoord = new ArrayList<Coordenada>();
		listaCoord.add(new Coordenada("34°35′59″S","58°22′55″O﻿"));
		listaCoord.add(new Coordenada("37°35′59″S","54°22′55″O﻿"));
		listaCoord.add(new Coordenada("14°25′59″S","28°22′55″O﻿"));
		listaCoord.add(new Coordenada("18°25′39″S","29°26′55″O﻿"));
		for(Coordenada c:listaCoord){
			tx.begin();
			Coordenada coord = new Coordenada();
			coord.setLatitud(c.getLatitud());
			coord.setLongitud(c.getLongitud());
			CoordenadaDao.getInstancia().persist(coord);
			tx.commit();
		}
		
		
		//Creo mapa de ruta
		tx.begin();

		MapaDeRuta mp = new MapaDeRuta();
		mp.setCantKm(150f);
		mp.setDuracion(8f);
		mp.setSucursalDestino(SucursalDao.getInstancia().getById(2));
		mp.setSucursalOrigen(SucursalDao.getInstancia().getById(1));
		mp.setCoordenadas(listaCoord);

		MapaDeRutaDao.getInstancia().persist(mp);
		tx.commit();	
		
		//Creo envio
		tx.begin();
		
		Envio e = new Envio();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
		try {
			Date date = sdf.parse("2016-09-21T12:08:56.235-0700");
			e.setFechaYHoraLlegadaEstimada(date);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		e.setEstado(EnvioEstado.EnViaje.toString());
		e.setFechaYHoraSalida(new Date());
		e.setPropio(true);
		e.setMapaDeRuta(MapaDeRutaDao.getInstancia().getById(1));
		e.setSucursalDestino(SucursalDao.getInstancia().getById(2));
		e.setSucursalOrigen(SucursalDao.getInstancia().getById(1));
		e.setVehiculo(VehiculoDao.getInstancia().getById(1));
		
		Coordenada coordActual = new Coordenada();
		coordActual.setLatitud("34°35′59″S");
		coordActual.setLongitud("58°22′55″O﻿");
		
		e.setPosicionActual(coordActual);
		
		EnvioDao.getInstancia().persist(e);
		
		tx.commit();	
		

		/*Seguira en viaje*/
		GestionControlViajes.getInstancia().actualizarEstadoVehiculo(1, CoordenadaDao.getInstancia().getById(1));
		Envio envio = EnvioDao.getInstancia().getById(1);
		System.out.println(envio.getEstado());
		
		/*Se indicara desviado*/
		Coordenada coordAct = new Coordenada();
		coordAct.setLatitud("54°35′59″S");
		coordAct.setLongitud("48°22′55″O﻿");
		
		GestionControlViajes.getInstancia().actualizarEstadoVehiculo(1, coordAct);
		Envio envio2 = EnvioDao.getInstancia().getById(1);
		System.out.println(envio2.getEstado());	
		
		/*Se indicara demorado*/
		GestionControlViajes.getInstancia().estaEnvioDemorado(1);
		Envio envio3 = EnvioDao.getInstancia().getById(1);
		System.out.println(envio3.getEstado());	
	}
	
	public static void testAsignarEnvios(){
		/*encomienda con 70% peso de posible vehiculo 1 (unico con tareas de mantenimiento realizadas) */
		
		Encomienda enc = testEncomienda(1,2,1,100,100f,430f,100f,0f,10);
		Envio envio = new Envio();
		Integer idEnvio = GestionEncomienda.getInstancia().asignarEnvio(enc.getIdEncomienda(), null);
		if(idEnvio!=null){
			envio = (Envio) EnvioDao.getInstancia().getById(idEnvio);
			System.out.println("Encomienda con 70% del peso del vehiculo 1 que esta disponible");
			System.out.println("Peso del Vehiculo: " + (envio.getVehiculo().getPeso() - envio.getVehiculo().getTara()));
			System.out.println("Peso de la encomienda: " + enc.getPeso());
			System.out.println("Envio creado para vehiculo "+ envio.getVehiculo().getIdVehiculo());
			System.out.println("sucursal origen:  "+ envio.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio.getSucursalDestino().getDescripcion());
			System.out.println("estado envio:  "+ envio.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc.getEstado());
			//System.out.println(envio.toString());
			
			EnvioDao.getInstancia().remove(envio);
			EncomiendaDao.getInstancia().remove(enc);
		}
		else{
			System.out.println("No se pudo asignar la encomienda a un envio.");
		}
		
		System.out.println("-----------------------------------------------------------------------------");
	
		/*Encomienda con 70% volumen de posible vehiculo 1 (unico con tareas de mantenimiento realizadas) */
		Encomienda enc2 = testEncomienda(1,2,1,100,100f,100f,2264f,0f,10);
		Envio envio2 = new Envio();
		Integer idEnvio2 = GestionEncomienda.getInstancia().asignarEnvio(enc2.getIdEncomienda(), null);
		if(idEnvio2!=null){
			envio2 = (Envio) EnvioDao.getInstancia().getById(idEnvio2);
			System.out.println("Encomienda con 70% del volumen del vehiculo 1 que esta disponible");
			System.out.println("Volumen del Vehiculo: " + envio2.getVehiculo().getVolumen());
			System.out.println("Volumen de la encomienda: " + enc2.getVolumen());
			System.out.println("Envio creado para vehiculo "+ envio2.getVehiculo().getIdVehiculo());
			System.out.println("sucursal origen:  "+ envio2.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio2.getSucursalDestino().getDescripcion());
			System.out.println("estado envio:  "+ envio2.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc2.getEstado());
			//System.out.println(envio.toString());
			
			EnvioDao.getInstancia().remove(envio2);
			EncomiendaDao.getInstancia().remove(enc2);
		}
		else{
			System.out.println("No se pudo asignar la encomienda a un envio.");
		}
		
		
		System.out.println("-----------------------------------------------------------------------------");
		
		/*Varias encomiendas asignadas hasta ocupar maximo peso*/
		Encomienda enc3 = testEncomienda(1,2,1,100,100f,100f,100f,0f,10);
		Envio envio3 = new Envio();
		Integer idEnvio3 = GestionEncomienda.getInstancia().asignarEnvio(enc3.getIdEncomienda(), null);
		if(idEnvio3!=null){
			envio3 = (Envio) EnvioDao.getInstancia().getById(idEnvio3);
			System.out.println("Encomienda con peso = 100");
			System.out.println("Peso del Vehiculo: " + (envio3.getVehiculo().getPeso() - envio3.getVehiculo().getTara()));
			System.out.println("Peso de la encomienda: " + enc3.getPeso());
			System.out.println("Envio creado para vehiculo "+ envio3.getVehiculo().getIdVehiculo());
			System.out.println("sucursal origen:  "+ envio3.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio3.getSucursalDestino().getDescripcion());
			System.out.println("estado envio:  "+ envio3.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc3.getEstado());
		}
		else{
			System.out.println("No se pudo asignar la encomienda a un envio.");
		}
			
		
		Encomienda enc4 = testEncomienda(1,2,1,100,100f,200f,100f,0f,10);
		Envio envio4 = new Envio();
		Integer idEnvio4 = GestionEncomienda.getInstancia().asignarEnvio(enc4.getIdEncomienda(), null);
		if(idEnvio4!=null){
			envio4 = (Envio) EnvioDao.getInstancia().getById(idEnvio4);
			System.out.println("Encomienda con peso = 200");
			System.out.println("Peso del Vehiculo: " + (envio4.getVehiculo().getPeso() - envio4.getVehiculo().getTara()));
			System.out.println("Peso de la encomienda: " + enc4.getPeso());
			System.out.println("Envio creado para vehiculo "+ envio4.getVehiculo().getIdVehiculo());
			System.out.println("sucursal origen:  "+ envio4.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio4.getSucursalDestino().getDescripcion());
			System.out.println("estado envio:  "+ envio4.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc4.getEstado());
		}
		else{
			System.out.println("No se pudo asignar la encomienda a un envio.");
		}
		
		
		Encomienda enc5 = testEncomienda(1,2,1,100,100f,300f,100f,0f,10);
		//System.out.println(enc.toString());
		Integer idEnvio5 = GestionEncomienda.getInstancia().asignarEnvio(enc5.getIdEncomienda(), null);
		Envio envio5 = new Envio();
		if(idEnvio5!=null){
			envio5 = (Envio) EnvioDao.getInstancia().getById(idEnvio5);
			System.out.println("Encomienda con peso = 300");
			System.out.println("Peso del Vehiculo: " + (envio5.getVehiculo().getPeso() - envio5.getVehiculo().getTara()));
			System.out.println("Peso de la encomienda: " + enc5.getPeso());
			System.out.println("Envio creado para vehiculo "+ envio5.getVehiculo().getIdVehiculo());
			System.out.println("sucursal origen:  "+ envio5.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio5.getSucursalDestino().getDescripcion());
			System.out.println("estado envio:  "+ envio5.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc5.getEstado());
		}
		else{
			System.out.println("No se pudo asignar la encomienda a un envio.");
		}
		
		
		
		Encomienda enc6 = testEncomienda(1,2,1,100,100f,200f,100f,0f,10);
		Envio envio6 = new Envio();
		Integer idEnvio6 = GestionEncomienda.getInstancia().asignarEnvio(enc6.getIdEncomienda(), null);
		if(idEnvio6 != null){
			envio6 = (Envio) EnvioDao.getInstancia().getById(idEnvio6);
			System.out.println("Encomienda con peso = 200");
			System.out.println("Peso del Vehiculo: " + (envio6.getVehiculo().getPeso() - envio6.getVehiculo().getTara()));
			System.out.println("Peso de la encomienda: " + enc6.getPeso());
			System.out.println("Envio creado para vehiculo "+ envio6.getVehiculo().getIdVehiculo());
			System.out.println("sucursal origen:  "+ envio6.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio6.getSucursalDestino().getDescripcion());
			System.out.println("estado :  "+ envio6.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc6.getEstado());
		}
		else{
			System.out.println("Encomienda con peso = 200");
			System.out.println("No se pudo asignar la encomienda a un envio.");
			}
		
		
		EnvioDao.getInstancia().remove(envio3);
		EnvioDao.getInstancia().remove(envio6);
		EncomiendaDao.getInstancia().remove(enc3);
		EncomiendaDao.getInstancia().remove(enc4);
		EncomiendaDao.getInstancia().remove(enc5);
		EncomiendaDao.getInstancia().remove(enc6);
		
		
		
		
		/*verificar metodo esEnvioTercerizado
		 * para encomienda con volumen granel
		 * y para encomienda que vence si no se manda ya*/
		
		Encomienda enc7 = testEncomienda(1,2,1,100,100f,200f,100f,200f,10);
		Envio envio7 = new Envio();
		Integer idEnvio7 = GestionEncomienda.getInstancia().asignarEnvio(enc7.getIdEncomienda(), null);
		if(idEnvio7 != null){
			envio7 = (Envio) EnvioDao.getInstancia().getById(idEnvio7);
			System.out.println("Encomienda Tercerizada, con volumen granel "+ enc7.getVolumenGranel());
			System.out.println("sucursal origen:  "+ envio7.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio7.getSucursalDestino().getDescripcion());
			System.out.println("estado :  "+ envio7.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc7.getEstado());
		}
		else{
			System.out.println("No se pudo asignar la encomienda a un envio.");
			}
		
		
		EnvioDao.getInstancia().remove(envio7);
		EncomiendaDao.getInstancia().remove(enc7);
		
		Encomienda enc8 = testEncomienda(1,2,1,100,100f,200f,100f,200f,1);
		Envio envio8 = new Envio();
		Integer idEnvio8 = GestionEncomienda.getInstancia().asignarEnvio(enc8.getIdEncomienda(), null);
		if(idEnvio8 != null){
			envio8 = (Envio) EnvioDao.getInstancia().getById(idEnvio8);
			System.out.println("Encomienda Tercerizada con fecha estimada de entrega: "+ enc8.getFechaEstimadaEntrega());
			System.out.println("sucursal origen:  "+ envio8.getSucursalOrigen().getDescripcion());
			System.out.println("sucursal destino:  "+ envio8.getSucursalDestino().getDescripcion());
			System.out.println("estado envio:  "+ envio8.getEstado());
			System.out.println("Encomienda tiene estado :  "+ enc8.getEstado());
		}
		else{
			System.out.println("No se pudo asignar la encomienda a un envio.");
			}
		
		EnvioDao.getInstancia().remove(envio8);
		EncomiendaDao.getInstancia().remove(enc8);
		
		/* TODO
		 * 1. Metodo para cambiar de estados encomiendas y sus envios
		 * 
		 * */
		
		}
	
	
	
	public static Encomienda testEncomienda(int idSucursalOrigen, int idSucursalDestino, int idCliente, int nmro, float alto
			,float peso, float volumen, float carga, int dias){
		float nro = nmro;
		DTO_ClienteParticular cli = new DTO_ClienteParticular();
		cli.setId(idCliente);
    	DTO_Sucursal sucursalOrigen = SucursalDao.getInstancia().getById(idSucursalOrigen).toDTO();
    	DTO_Sucursal sucursalDestino = SucursalDao.getInstancia().getById(idSucursalDestino).toDTO();
    	
    	DTO_EncomiendaParticular encomienda = new DTO_EncomiendaParticular();

		encomienda.setCliente(cli);
		encomienda.setSucursalActual(sucursalOrigen);
		encomienda.setSucursalOrigen(sucursalOrigen);
		encomienda.setSucursalDestino(sucursalDestino);
		encomienda.setLargo(nro);
		encomienda.setAncho(nro);
			
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date()); // Configuramos la fecha que se recibe
		calendar.add(Calendar.DAY_OF_YEAR, dias);  // numero de días a añadir, o restar en caso de días<0
		Date fecha = calendar.getTime();
		encomienda.setFechaEstimadaEntrega(fecha);
		
		encomienda.setAlto(alto);
		encomienda.setPeso(peso);
		encomienda.setVolumen(volumen);
		encomienda.setTratamiento("nada"); 
		encomienda.setApilable(true);
		encomienda.setCantApilable((short)2); 
		encomienda.setRefrigerado(false);
		encomienda.setCondicionTransporte(null); 
		encomienda.setIndicacionesManipulacion(null);
		encomienda.setFragilidad("no"); 
		encomienda.setNombreReceptor("Alfredo"); 
		encomienda.setApellidoReceptor("Receptor");
		encomienda.setDniReceptor("99876543"); 
		encomienda.setVolumenGranel(carga); 
		encomienda.setUnidadGranel(null);
		if(carga>0)
			encomienda.setCargaGranel("Carga Granel");	
		
		Encomienda enc = GestionEncomienda.getInstancia().crearEncomiendaParticular(encomienda);
		return enc;
	}
	
	
	
}
