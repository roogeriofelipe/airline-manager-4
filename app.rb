require "selenium-webdriver"
require "rspec"

describe "teste" do
    it "acess the website" do
        #driver = Selenium::WebDriver.for :chrome

        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('--headless')
        driver = Selenium::WebDriver.for :chrome, options: options

        can_fly = true

        programa = true
        while programa
            driver.navigate.to "https://www.airline4.net/?gameType=app&uid={YOUR-U-ID}&uid_token={YOUR-U-ID-TOKEN&mail={YOUR-MAIL}&mail_token={YOUR-MAIL-TOKEN}&device={YOUR-DEVICE}&version={YOUR-VERSION}#" rescue next
            puts "INICIANDO OS TRABALHOS NA CIA AEREA"
            sleep(5)

            fuel_button = driver.find_element(:xpath, '//*[@id="mapMaint"]/div/div') rescue false
            fuel_button.click rescue next
            sleep(10)
            
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

            eco_price = driver.find_element(:xpath, '//*[@id="sumCost"]').text
            eco_price = eco_price.sub(",", '')
            eco_price = eco_price.to_i
            if eco_price <= 120     
                buy_eco_field  = driver.find_element(:xpath, '//*[@id="amountInput"]')
                buy_eco_field.send_keys("1000000000")
                
                buy_eco_button = driver.find_element(:xpath, '//*[@id="co2Main"]/div/div[8]/div/button[2]')
                buy_eco_button.click rescue false
            end

            close_button = driver.find_element(:xpath, '//*[@id="popup"]/div/div/div[1]/div/span')
            close_button.click rescue next

            sleep(10)

            map_routes = driver.find_element(:xpath, '//*[@id="mapRoutes"]')
            map_routes.click rescue next

            sleep(10)

            departure_button = driver.find_element(:xpath, '/html/body/div[6]/div/div/div[3]/div[2]/div[2]/div[1]/div[2]/div/button[2]') rescue false
            if can_fly
                departure_button.click rescue false
                puts "DECOLAGEM AUTORIZADA"
            else
                puts "DECOLAGEM NÃO AUTORIZADA"
            end
            sleep(2)

            close_button = driver.find_element(:xpath, '//*[@id="popup"]/div/div/div[1]/div/span')
            close_button.click rescue next
            
            sleep(60)
        end
    end
end
