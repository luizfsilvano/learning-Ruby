class Usuario
  def initialize(nome, sobrenome, email, senha, telefone, idade)
    @nome = nome
    @sobrenome = sobrenome
    @email = email
    @senha = senha
    @telefone = telefone
    @idade = idade
  end

  def nome
    @nome
  end

  def sobrenome
    @sobrenome
  end

  def senha
    @senha
  end

  def email
    @email
  end

  def telefone
    @telefone
  end

  def idade
    @idade
  end
end

$usuarios = []
$logado = false

def registro
  puts "Digite seu nome: "
  nome = gets.chomp.to_s
  puts "Digite seu sobrenome: "
  sobrenome = gets.chomp.to_s
  puts "Digite sua idade: "
  idade = gets.chomp.to_i
  puts "Digite seu email: "
  email = gets.chomp.to_s
  puts "Digite sua senha: "
  senha = gets.chomp.to_s
  puts "Digite seu telefone: "
  telefone = gets.chomp

  $usuarios << Usuario.new(nome, sobrenome, email, senha, telefone, idade)
  puts "Usuário criado com sucesso!"
  return
end

def login(email, senha)
  usuario = $usuarios.find { |usuario| usuario.email == email && usuario.senha == senha }
  if usuario
    puts "Login bem sucedido!"
    $logado = true
    $usuario_logado = usuario
  else
    puts "Email ou senha incorretos."
    $logado = false
  end
end

def perfil
  if $logado
    puts "Nome: #{$usuario_logado.nome + " " + $usuario_logado.sobrenome}"
    puts "Idade: #{$usuario_logado.idade}"
    puts "Telefone: #{$usuario_logado.telefone}"
    puts "Email: #{$usuario_logado.email}"
  else
    puts "Usuário não está logado"
  end
end


def main
  $rodando = true
  while $rodando
    puts "-----------------------------------"
    puts "- Bem-vindo, selecione uma opção: -"
    puts "-----------------------------------"
    puts "- 1 - Registrar-se                -"
    puts "- 2 - Login                       -"
    puts "- 3 - Perfil                      -"
    puts "- 4 - Sair                        -"
    puts "-----------------------------------"
    opcao = gets.to_i
    case opcao
      when 1
        registro
      when 2
        puts "Digite seu email: "
        email = gets.chomp.to_s
        puts "Digite sua senha: "
        senha = gets.chomp.to_s
        login(email, senha)
      when 3
        perfil
      when 4
        puts("Saindo do programa")
        $rodando = false
        break
    else
      puts("Opcao Inválida")
    end
  end
end

main