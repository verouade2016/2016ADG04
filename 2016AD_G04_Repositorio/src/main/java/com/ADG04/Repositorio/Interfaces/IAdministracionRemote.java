package com.ADG04.Repositorio.Interfaces;

import java.rmi.RemoteException;
import java.util.List;

import com.ADG04.bean.Administracion.DTO_Rol;
import com.ADG04.bean.Administracion.DTO_Sucursal;
import com.ADG04.bean.Administracion.DTO_Usuario;
import com.ADG04.bean.Cliente.DTO_ClienteParticular;
import com.ADG04.bean.Proveedor.DTO_TarifasCarrier;
import com.ADG04.bean.Proveedor.DTO_Proveedor;
import com.ADG04.bean.Proveedor.DTO_Seguro;
import com.ADG04.bean.Proveedor.DTO_ServicioSeguridad;
import com.ADG04.bean.Vehiculo.DTO_PlanMantenimiento;
import com.ADG04.bean.Vehiculo.DTO_TareaMantenimiento;
import com.ADG04.bean.Vehiculo.DTO_TareasPorKilometro;
import com.ADG04.bean.Vehiculo.DTO_TareasPorTiempo;
import com.ADG04.bean.Vehiculo.DTO_Vehiculo;

public interface IAdministracionRemote {

	/***************** Usuario (Empleado) *************************************/
	public void altaUsuario(DTO_Usuario Usuario) throws RemoteException;
	public void modificarUsuario(DTO_Usuario Usuario) throws RemoteException;
	public void bajaUsuario(Integer idUsuario) throws RemoteException;
	public DTO_Usuario getUsuario(Integer idUsuario) throws RemoteException;
	public DTO_Usuario getUsuario(String dni) throws RemoteException;
	public DTO_Usuario login(String usuario, String password) throws RemoteException;
	public List<String> buscarRolesUsuario(int usuario) throws RemoteException;
	
	/*************************** Sucursal *************************************/
	public void altaSucursal(DTO_Sucursal sucursal) throws RemoteException;
	public void modificarSucursal(DTO_Sucursal sucursal) throws RemoteException;
	public void bajaSucursal(Integer idSucursal) throws RemoteException;
	public DTO_Sucursal getSucursal(Integer idSucursal) throws RemoteException;
	
	
	/*************************** Proveedores *************************************/
	public void altaProveedor(DTO_Proveedor prov) throws RemoteException;
	public void altaSeguro(DTO_Seguro seguro) throws RemoteException;
	public void modificarSeguro(DTO_Seguro seguro) throws RemoteException;
	public void altaServicioSeguridad(DTO_ServicioSeguridad servicioSeguridad) throws RemoteException;
	public void modificarServicioSeguridad(DTO_ServicioSeguridad servicioSeguridad) throws RemoteException;
	public void altaTallerMecanico(DTO_Proveedor taller) throws RemoteException;
	public void modificarTallerMecanico(DTO_Proveedor taller) throws RemoteException;
	public void altaCarrier(DTO_TarifasCarrier carrier) throws RemoteException;
	public void modificarCarrier(DTO_TarifasCarrier carrier) throws RemoteException;
	public void bajaProveedor(Integer idProveedor) throws RemoteException;
	public List<DTO_Seguro> getSeguros() throws RemoteException;
	public List<DTO_TarifasCarrier> getTarifasCarriers() throws RemoteException;
	public List<DTO_ServicioSeguridad> getServicioSeguridad() throws RemoteException;
	public List<DTO_Proveedor> getTalleresMecanicos() throws RemoteException;
	public List<DTO_Proveedor> getAseguradoras() throws RemoteException;
	public List<DTO_Proveedor> getEmpresasServiciosSeguridad() throws RemoteException;
	public List<DTO_Proveedor> getCarriers() throws RemoteException;
}
