Dado("que preencha os valores {word}") do |type|
  @calc = Calculadora.new
  @calc.fill_first_number CREDENTIALS[type][:first_value]
  @calc.fill_second_number CREDENTIALS[type][:second_value]
end

Dado("que preencha o primeiro valor valido") do
  @calc = Calculadora.new
  @calc.fill_first_number CREDENTIALS['validos'][:first_value]
end

Dado("o segundo valor com {int}") do |int|
  @calc.fill_second_number 0
end

Quando("selecionar Sum") do
  @calc.touch_sum_button
end

Quando("selecionar Subtract") do
  @calc.touch_subtract_button
end

Quando("selecionar Divide") do
  @calc.touch_divide_button
end

Entao("soma deve ser exibida corretamente") do
  expect(@calc.text).to eq (CREDENTIALS['validos'][:first_value] + CREDENTIALS['validos'][:second_value]).to_s
end

Entao("subtracao deve ser exibida corretamente") do
  expect(@calc.text).to eq (CREDENTIALS['validos'][:first_value] - CREDENTIALS['validos'][:second_value]).to_s
end

Entao("divisão deve ser exibida corretamente") do
  expect(@calc.text).to eq (CREDENTIALS['validos'][:first_value] / CREDENTIALS['validos'][:second_value]).to_s
end

Entao("deve ser apresentado mensagem {string}") do |string|
  expect(@calc.text).to eq string
end
