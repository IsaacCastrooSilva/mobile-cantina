import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_button.dart';
import '../utils/validators.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'João Silva');
  final _emailController = TextEditingController(text: 'joao.silva@email.com');
  final _phoneController = TextEditingController(text: '(11) 99999-9999');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: Responsive.paddingHorizontal(context, 6.4),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildProfilePhoto(context),
                        const SizedBox(height: 32),
                        _buildForm(context),
                        const SizedBox(height: 32),
                        _buildSaveButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
          ).animate().fadeIn().slideX(begin: -0.3),
          const Spacer(),
          Text(
            'Editar Perfil',
            style: GoogleFonts.poppins(
              fontSize: Responsive.sp(context, 20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(delay: 200.ms),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildProfilePhoto(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.primaryColor, Color(0xFF8B7EFF)],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.user,
              color: Colors.white,
              size: 48,
            ),
          ),
        ).animate().scale(duration: 800.ms, curve: Curves.elasticOut),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const FaIcon(
              FontAwesomeIcons.camera,
              color: Colors.black,
              size: 16,
            ),
          ),
        ).animate(delay: 500.ms).scale(),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _nameController,
          label: 'Nome completo',
          hint: 'Digite seu nome completo',
          prefixIcon: FontAwesomeIcons.user,
          validator: Validators.name,
        ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.3),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _emailController,
          label: 'E-mail',
          hint: 'Digite seu e-mail',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: FontAwesomeIcons.envelope,
          validator: Validators.email,
        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _phoneController,
          label: 'Celular',
          hint: 'Digite seu celular',
          keyboardType: TextInputType.phone,
          prefixIcon: FontAwesomeIcons.phone,
          validator: Validators.phone,
        ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.3),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return GradientButton(
      text: 'Salvar Alterações',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Perfil atualizado com sucesso!',
                style: GoogleFonts.poppins(),
              ),
              backgroundColor: AppTheme.primaryColor,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
          Navigator.pop(context);
        }
      },
    ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3);
  }
}