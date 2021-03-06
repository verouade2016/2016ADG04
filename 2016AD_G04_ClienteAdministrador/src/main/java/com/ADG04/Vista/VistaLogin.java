package com.ADG04.Vista;


import javax.swing.*;

import com.ADG04.Controller.Controlador;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class VistaLogin {

	private JFrame frmLogin;
	private JTextField fieldUsuario;
	private JLabel lblContrasenia;
	private JPasswordField passFieldContrasenia;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				VistaLogin window = new VistaLogin();
				window.frmLogin.setVisible(true);
			}
		});
	}

	public VistaLogin() {
		initialize();
	}

	private void initialize() {
		frmLogin = new JFrame();
		frmLogin.setResizable(false);
		frmLogin.getContentPane().setFont(new Font("Tahoma", Font.PLAIN, 14));
		frmLogin.setTitle("Login");
		frmLogin.setBounds(100, 100, 280, 145);
		frmLogin.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmLogin.getContentPane().setLayout(null);
		
		JLabel usuarioLbl = new JLabel("Usuario:");
		usuarioLbl.setBounds(23, 12, 100, 17);
		usuarioLbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		frmLogin.getContentPane().add(usuarioLbl);
		
		fieldUsuario = new JTextField();
		fieldUsuario.setBounds(108, 11, 139, 20);
		frmLogin.getContentPane().add(fieldUsuario);
		fieldUsuario.setColumns(10);
		
		lblContrasenia = new JLabel("Contrase\u00F1a:");
		lblContrasenia.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lblContrasenia.setBounds(23, 52, 100, 14);
		frmLogin.getContentPane().add(lblContrasenia);
		
		passFieldContrasenia = new JPasswordField();
		passFieldContrasenia.setBounds(108, 51, 139, 20);
		frmLogin.getContentPane().add(passFieldContrasenia);
		passFieldContrasenia.setColumns(10);
		
		JButton btnAceptar = new JButton("Aceptar");
		btnAceptar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt) {
				Integer codigoUsuario = Controlador.getInstancia().login(fieldUsuario.getText(), passFieldContrasenia.getText());
				if(codigoUsuario==null){
					JOptionPane.showMessageDialog(frmLogin, "Usuario o Password incorrectos");
				}else{
					frmLogin.setVisible(false);
					VistaMenu m = new VistaMenu(codigoUsuario);
					m.setVisible(true);
				}
			}
		});
		btnAceptar.setBounds(158, 82, 89, 23);
		frmLogin.getContentPane().add(btnAceptar);
	}
	
	
}
