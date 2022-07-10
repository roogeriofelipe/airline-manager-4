require "selenium-webdriver"
require "rspec"

describe "teste" do
    it "acess the website" do
        driver = Selenium::WebDriver.for :chrome

        #options = Selenium::WebDriver::Chrome::Options.new
        #options.add_argument('--headless')
        #driver = Selenium::WebDriver.for :chrome, options: options

        driver.navigate.to "https://www.airline4.net/" rescue next

        sleep(30)

        can_fly = true

        programa = true
        while programa
            driver.navigate.to "https://www.airline4.net/" rescue next
            puts "INICIANDO OS TRABALHOS NA CIA AEREA"
            sleep(5)

            # ABRIR MODAL DE GAS E ECO
            fuel_button = driver.find_element(:xpath, '//*[@id="mapMaint"]/div/div') rescue false
            fuel_button.click rescue next
            sleep(10)
            
            # COMPRAR GAS
            gas_price = driver.find_element(:xpath, '//*[@id="sumCost"]').text rescue next
            gas_price = gas_price.sub(",", '')
            gas_price = gas_price.to_i
            if gas_price <= 700
                buy_gas_field  = driver.find_element(:xpath, '//*[@id="amountInput"]')
                buy_gas_field.send_keys("1000000000") rescue next
    
                buy_gas_button = driver.find_element(:xpath, '//*[@id="fuelMain"]/div/div[7]/div/button[2]')
                buy_gas_button.click rescue false    
            end

            # IR PARA O ECO
            eco_button = driver.find_element(:xpath, '//*[@id="popBtn2"]')
            eco_button.click rescue next
            sleep(10)

            eco_capacity = driver.find_element(:xpath, '//*[@id="holding"]').text
            eco_capacity = eco_capacity.sub(",", '')
            eco_capacity = eco_capacity.sub(",", '')
            if eco_capacity.to_i < 5000000
                can_fly = false
                puts "NÃO PODE VOAR - ECO CAPACITY ABAIXO DE 3.000,000. CAPACIDADE ATUAL: " + eco_capacity.to_s
            else 
                can_fly = true
                puts "PODE VOAR - ECO CAPACITY ACIMA DE 3.300,000"
            end

            # COMPRAR ECO
            eco_price = driver.find_element(:xpath, '//*[@id="sumCost"]').text
            eco_price = eco_price.sub(",", '')
            eco_price = eco_price.to_i
            if eco_price <= 120     
                buy_eco_field  = driver.find_element(:xpath, '//*[@id="amountInput"]')
                buy_eco_field.send_keys("1000000000")
                
                buy_eco_button = driver.find_element(:xpath, '//*[@id="co2Main"]/div/div[8]/div/button[2]')
                buy_eco_button.click rescue false
            end

            # FECHAR JANELA DO GAS E ECO
            close_button = driver.find_element(:xpath, '//*[@id="popup"]/div/div/div[1]/div/span')
            close_button.click rescue next

            sleep(10)

            # ABRIR MODAL DE ROTAS
            map_routes = driver.find_element(:xpath, '//*[@id="mapRoutes"]') rescue false
            map_routes.click rescue false

            sleep(10)

            # DECOLAR AS ROTAS
            departure_button = driver.find_element(:xpath, '/html/body/div[6]/div/div/div[3]/div[2]/div[2]/div[1]/div[2]/div/button[2]') rescue false
            if can_fly
                departure_button.click rescue false
                driver.navigate.to "https://www.airline4.net/route_depart.php?mode=all&ids=x" rescue next
                puts "DECOLAGEM AUTORIZADA"
                next
            else
                puts "DECOLAGEM NÃO AUTORIZADA"
            end
            sleep(2)

            # FECHAR A MODAL DE ROTAS
            close_button = driver.find_element(:xpath, '//*[@id="popup"]/div/div/div[1]/div/span') rescue next
            close_button.click rescue next
            
            # AGUARDAR OS SEGUNDOS PARA REINICIAR O PROCESSO.
            sleep(60)
        end
    end
end
