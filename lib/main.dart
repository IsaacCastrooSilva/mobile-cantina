import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'theme/app_theme.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/gradient_button.dart';

void main() {
  runApp(const FinnTechApp());
}

class FinnTechApp extends StatelessWidget {
  const FinnTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinnTech',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1A1F3A),
              Color(0xFF2D1B69),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C63FF).withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/tcc.png',
                    height: 200,
                  ),
                ).animate().scale(duration: 800.ms, curve: Curves.elasticOut),
                const SizedBox(height: 40),
                Text(
                  'FinnTech',
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.3),
                const SizedBox(height: 16),
                Text(
                  'Transforme seu pedido saudável\nEncontrando os melhores produtos na nossa loja',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                    height: 1.5,
                  ),
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3),
                const Spacer(),
                Column(
                  children: [
                    GradientButton(
                      text: 'Entrar',
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.3),
                    const SizedBox(height: 16),
                    GradientButton(
                      text: 'Criar conta',
                      isOutlined: true,
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ).animate().fadeIn(delay: 1200.ms).slideY(begin: 0.3),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1A1F3A),
              Color(0xFF2D1B69),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                  ).animate().fadeIn().slideX(begin: -0.3),
                  const SizedBox(height: 20),
                  Text(
                    'Bem-vindo\nde volta!',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),
                  const SizedBox(height: 8),
                  Text(
                    'Entre com sua conta para continuar',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
                  const SizedBox(height: 40),
                  CustomTextField(
                    label: 'E-mail',
                    hint: 'Digite seu e-mail',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: FontAwesomeIcons.envelope,
                  ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Senha',
                    hint: 'Digite sua senha',
                    isPassword: true,
                    prefixIcon: FontAwesomeIcons.lock,
                  ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.3),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child: Text(
                        'Esqueceu a senha?',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF6C63FF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: 1000.ms),
                  const SizedBox(height: 32),
                  GradientButton(
                    text: 'Entrar',
                    onPressed: () {},
                  ).animate().fadeIn(delay: 1200.ms).slideY(begin: 0.3),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.white24)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'ou continue com',
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: Colors.white24)),
                    ],
                  ).animate().fadeIn(delay: 1400.ms),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(delay: 1600.ms).slideY(begin: 0.3),
                  const SizedBox(height: 32),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não tem uma conta? ',
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Cadastre-se',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF6C63FF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 1800.ms),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1A1F3A),
              Color(0xFF2D1B69),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                  ).animate().fadeIn().slideX(begin: -0.3),
                  const SizedBox(height: 20),
                  Text(
                    'Criar\nConta',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),
                  const SizedBox(height: 8),
                  Text(
                    'Preencha os dados para criar sua conta',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
                  const SizedBox(height: 32),
                  CustomTextField(
                    label: 'Nome completo',
                    hint: 'Digite seu nome completo',
                    prefixIcon: FontAwesomeIcons.user,
                  ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'E-mail',
                    hint: 'Digite seu e-mail',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: FontAwesomeIcons.envelope,
                  ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.3),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Celular',
                    hint: 'Digite seu celular',
                    keyboardType: TextInputType.phone,
                    prefixIcon: FontAwesomeIcons.phone,
                  ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.3),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Senha',
                    hint: 'Digite sua senha',
                    isPassword: true,
                    prefixIcon: FontAwesomeIcons.lock,
                  ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.3),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Confirmar senha',
                    hint: 'Confirme sua senha',
                    isPassword: true,
                    prefixIcon: FontAwesomeIcons.lock,
                  ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.3),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: _acceptTerms,
                            onChanged: (value) {
                              setState(() {
                                _acceptTerms = value ?? false;
                              });
                            },
                            activeColor: const Color(0xFF6C63FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Li e aceito os termos de uso e a política de privacidade',
                            style: GoogleFonts.poppins(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 1100.ms).slideY(begin: 0.3),
                  const SizedBox(height: 32),
                  GradientButton(
                    text: 'Criar Conta',
                    onPressed: _acceptTerms ? () {} : () {},
                  ).animate().fadeIn(delay: 1200.ms).slideY(begin: 0.3),
                  const SizedBox(height: 24),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já tem uma conta? ',
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Entre aqui',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF6C63FF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 1400.ms),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1A1F3A),
              Color(0xFF2D1B69),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                  ).animate().fadeIn().slideX(begin: -0.3),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.key,
                      color: Color(0xFF6C63FF),
                      size: 40,
                    ),
                  ).animate().fadeIn(delay: 200.ms).scale(),
                  const SizedBox(height: 32),
                  Text(
                    'Esqueceu\nsua senha?',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
                  const SizedBox(height: 16),
                  Text(
                    'Não se preocupe! Informe seu e-mail e enviaremos um link para redefinir sua senha.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3),
                  const SizedBox(height: 40),
                  CustomTextField(
                    label: 'E-mail',
                    hint: 'Digite seu e-mail',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: FontAwesomeIcons.envelope,
                  ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.3),
                  const SizedBox(height: 32),
                  GradientButton(
                    text: 'Enviar Link',
                    onPressed: () {
                      // Mostrar snackbar de sucesso
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Link enviado para seu e-mail!',
                            style: GoogleFonts.poppins(),
                          ),
                          backgroundColor: const Color(0xFF6C63FF),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                  ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.3),
                  const SizedBox(height: 24),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: Color(0xFF6C63FF),
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Voltar ao login',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF6C63FF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(delay: 1200.ms),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}