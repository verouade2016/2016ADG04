package com.ADG04.Servidor.model;
// default package
// Generated Sep 8, 2016 3:23:54 PM by Hibernate Tools 3.4.0.CR1

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.ADG04.bean.Vehiculo.DTO_PlanMantenimiento;

@Entity
@Table(name = "PlanMantenimiento")
public class PlanMantenimiento implements java.io.Serializable {

	@Id
	@GeneratedValue
	@Column(name = "IdPlanMantenimiento", unique = true, nullable = false)
	private int idPlanMantenimiento;
	
	@Column(name = "Descripcion", nullable = false, length = 50)
	private String descripcion;

	@Column(name = "Comentarios", nullable = false)
	private String comentarios;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "planMantenimiento")
	private List<Vehiculo> vehiculos;
	

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "planMantenimiento")
	private List<TareaMantenimiento> tareaMantenimientos;

	public PlanMantenimiento() {
	}

	public PlanMantenimiento(String descripcion,String comentarios) {
		this.descripcion = descripcion;
		this.comentarios = comentarios;
	}


	public int getIdPlanMantenimiento() {
		return this.idPlanMantenimiento;
	}

	public void setIdPlanMantenimiento(int idPlanMantenimiento) {
		this.idPlanMantenimiento = idPlanMantenimiento;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getComentarios() {
		return this.comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public List<Vehiculo> getVehiculos() {
		return vehiculos;
	}

	public void setVehiculos(List<Vehiculo> vehiculos) {
		this.vehiculos = vehiculos;
	}

	public List<TareaMantenimiento> getTareaMantenimientos() {
		return tareaMantenimientos;
	}

	public void setTareaMantenimientos(List<TareaMantenimiento> tareaMantenimientos) {
		this.tareaMantenimientos = tareaMantenimientos;
	}

	public void addTarea(TareaMantenimiento tarea){
		
		if(this.tareaMantenimientos == null)
			this.tareaMantenimientos = new ArrayList<TareaMantenimiento>();
		
		this.tareaMantenimientos.add(tarea);
	}

	public DTO_PlanMantenimiento toDTO() {
		DTO_PlanMantenimiento dto = new DTO_PlanMantenimiento();
		dto.setComentarios(this.getComentarios());
		dto.setDescripcion(this.getDescripcion());
		return dto;
	}
}
