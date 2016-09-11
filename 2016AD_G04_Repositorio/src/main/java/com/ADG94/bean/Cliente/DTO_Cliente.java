package com.ADG94.bean.Cliente;

import java.io.Serializable;

import com.ADG94.bean.Administracion.DTO_Direccion;

public class DTO_Cliente implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private int idTipoCliente;
	private String razonSocial;
	private String nombre;
	private String apellido;
	private String dni;
	private String cuit;
	private boolean estado;
	private DTO_Direccion direccion;
	private String email;
	private String telefono;
	private DTO_CuentaCorriente cuentaCorriente;
	
	public DTO_Cliente(){
		
	}

	public Integer getId() {
		return id;
	}

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public String getCuit() {
		return cuit;
	}

	public void setCuit(String cuit) {
		this.cuit = cuit;
	}

	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public DTO_Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(DTO_Direccion direccion) {
		this.direccion = direccion;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public DTO_CuentaCorriente getCuentaCorriente() {
		return cuentaCorriente;
	}

	public void setCuentaCorriente(DTO_CuentaCorriente cuentaCorriente) {
		this.cuentaCorriente = cuentaCorriente;
	}

	public int getIdTipoCliente(int idTipoCliente){
		return this.idTipoCliente;
	}
	
	public void setIdTipoCliente(int idTipoCliente){
		this.idTipoCliente = idTipoCliente;
	}
}
