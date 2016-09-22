package com.ADG04.Servidor;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.sound.sampled.Clip;

import com.ADG04.Negocio.GestionAdministracion;
import com.ADG04.Negocio.GestionCliente;
import com.ADG04.Negocio.GestionEncomienda;
import com.ADG04.Negocio.GestionVehiculo;
import com.ADG04.Servidor.dao.ClienteDao;
import com.ADG04.Servidor.dao.EncomiendaDao;
import com.ADG04.Servidor.dao.PaisDao;
import com.ADG04.Servidor.dao.ProvinciaDao;
import com.ADG04.Servidor.dao.TallerMecanicoDao;
import com.ADG04.Servidor.model.Cliente;
import com.ADG04.Servidor.model.Direccion;
import com.ADG04.Servidor.model.Encomienda;
import com.ADG04.Servidor.model.Pais;
import com.ADG04.Servidor.model.Provincia;
import com.ADG04.Servidor.util.EntityManagerProvider;
import com.ADG04.bean.Administracion.DTO_Direccion;
import com.ADG04.bean.Administracion.DTO_Pais;
import com.ADG04.bean.Administracion.DTO_RolUsuario;
import com.ADG04.bean.Administracion.DTO_Sucursal;
import com.ADG04.bean.Administracion.DTO_Usuario;
import com.ADG04.bean.Cliente.DTO_ClienteParticular;
import com.ADG04.bean.Encomienda.DTO_Encomienda;
import com.ADG04.bean.Encomienda.DTO_EncomiendaParticular;
import com.ADG04.bean.Vehiculo.DTO_PlanMantenimiento;
import com.ADG04.bean.Vehiculo.DTO_TareaMantenimientoRealizada;
import com.ADG04.bean.Vehiculo.DTO_TareasPorKilometro;
import com.ADG04.bean.Vehiculo.DTO_TareasPorTiempo;



/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	TestPlanMantenimiento();
    	
//    	TestEncomienda();
    	//TestFacturaEncomiendaParticular();
    	//TestAltaCliente();
    	//TestSucursal("Sucursal Origen");
    	//TestSucursal("Sucursal Destino");
    	
 //   	TestPaisDao();
    //	TestUsuario();
    }
    
    private static void TestPlanMantenimiento() {
		
    	DTO_PlanMantenimiento pm = new DTO_PlanMantenimiento();
    	pm.setComentarios("Mi primer plan");
    	pm.setDescripcion("Plan Toyota");
    	pm.setTolerancia(123);
    	
    	int idPm = GestionVehiculo.getInstancia().altaPlanMantenimiento(pm);
    	DTO_TareasPorKilometro tareaXKM = new DTO_TareasPorKilometro();
    	tareaXKM.setCantidadKilometros(123);
    	tareaXKM.setIdPlanMantenimiento(idPm);
    	tareaXKM.setTarea("Cambiar ruedas");
    	GestionVehiculo.getInstancia().altaTareaMantenimiento(tareaXKM);
    	
    	DTO_TareasPorTiempo tareaXTiempo = new DTO_TareasPorTiempo();
    	tareaXTiempo.setCantidadDias(656);
    	tareaXTiempo.setIdPlanMantenimiento(idPm);
    	tareaXTiempo.setTarea("Cambiar aceite");
    	int idTarea = GestionVehiculo.getInstancia().altaTareaMantenimiento(tareaXTiempo);
    	
    	DTO_TareaMantenimientoRealizada tRealizada = new DTO_TareaMantenimientoRealizada();
    	tRealizada.setFecha(new Date());
    	tRealizada.setIdProveedor(2);
    	tRealizada.setIdVehiculo(1);
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
		
		double nro = 123;
		DTO_ClienteParticular cli = new DTO_ClienteParticular();
		cli.setId(1);
    	DTO_Sucursal sucursalOrigen = new DTO_Sucursal();
    	DTO_Sucursal sucursalDestino = new DTO_Sucursal();
    	sucursalOrigen.setId(5);
    	sucursalDestino.setId(6);
    	
    	DTO_EncomiendaParticular encomienda = new DTO_EncomiendaParticular();

		encomienda.setCliente(cli);
		encomienda.setSucursalOrigen(sucursalOrigen);
		encomienda.setSucursalDestino(sucursalDestino);
		encomienda.setLargo(nro);
		encomienda.setAncho(nro);
		
		encomienda.setAlto(12.0);
		encomienda.setPeso(34.6);
		encomienda.setVolumen(44.5);
		//encomienda.setTratamiento("nada"); 
		encomienda.setApilable(true);
		encomienda.setCantApilable((short)2); 
		encomienda.setRefrigerado(false);
		//encomienda.setCondicionTransporte(condiciionTransporte); 
		//encomienda.setIndicacionesManipulacion(indicacionesManipulacion);
		//encomienda.setFragilidad(fragilidad); 
		encomienda.setNombreReceptor("Alfredo"); 
		encomienda.setApellidoReceptor("Receptor");
		encomienda.setDniReceptor("99876543"); 
		//encomienda.setVolumenGranel(volumenGranel); 
		//encomienda.setUnidadGranel(unidadGranel);
		//encomienda.setCargaGranel(cargaGranel);		
		   	    	    	
    	GestionEncomienda.getInstancia().altaEncomiendaParticular(encomienda);
    }
    
}
