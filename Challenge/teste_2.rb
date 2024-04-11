rodando = true

def soma(num1, num2)
  puts "Resultado: #{num1 + num2}"
end

def sub(num1, num2)
  puts "Resultado: #{num1 - num2}"
end

def multi(num1, num2)
  puts "Resultado: #{num1 * num2}"
end

def div(num1, num2)
  if num2 == 0
    puts 'Não é possível dividir por zero'
  else
    puts "Resultado: #{num1 / num2}"
  end
end

def solicitar_numero
  print 'Digite dois números: '
  entrada = gets.split(' ')
  num1 = entrada[0].to_f
  num2 = entrada[1].to_f
  [num1, num2]
end

while rodando
  puts 'Escolha uma opção:'
  puts '1 - Soma'
  puts '2 - Subtração'
  puts '3 - Multiplicacao'
  puts '4 - Divisão'
  puts '0 - Sair'
  escolha = gets.chomp.to_i
  puts ''

  case escolha
  when 1
    soma(*solicitar_numero)
  when 2
    sub(*solicitar_numero)
  when 3
    multi(*solicitar_numero)
  when 4
    div(*solicitar_numero)
  when 0
    puts 'Saindo...'
    rodando = false
    break
  else
    puts 'Opção inválida'
  end
end
