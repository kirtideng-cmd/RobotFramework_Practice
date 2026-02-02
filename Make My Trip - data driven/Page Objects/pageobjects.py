popup_close = '//span[@data-cy="closeModal"]'
robot_popup_close = "//img[contains(@src,'close-icon.png')]//parent::div"
bus_icon = '//a[contains(@href,"/bus-tickets/")]'
input_tags = '//input[@id="replace"]' #there are 3 inputs on the page - fromCity, toCity, date
fromCity_input = "//input[@placeholder='From']"
toCity_input = "//input[@placeholder='To']"
same_city_error_msg = '//span[text() = "The Departure City and Destination City cannot be same. Please re-type."]'
travel_date = '//p[@data-cy="departureDate"]'
next_month_button = '//span[@aria-label="Next Month"]'
actual_date_element = '//div[contains(@aria-label, "date")]'
search_button = '//button[text()="Search"]'
from_city_page_2 = '//div[text()="FROM"]/following-sibling::div'
depart_page_2 = '//div[text()="DEPART"]/following-sibling::div'
to_city_page_2 = '//div[text()="TO"]/following-sibling::div'
heading_page_2 = '//h1[@data-testid="listing-title"]'
bus_card_price = '(//p[@class="BusCard_priceText__guR7e"])[1]' #points to price on all bus cards you can use indexing
bus_card_date = '(//span[@data-testid="departure-date"])[1]' #points to search buttons on all bus cards
bus_card_busname = '(//div[@data-testid="bus-card"]//p[@data-testid="operator-name"])[1]'
bus_select_seat_button = '(//button[text()="Select Seats"])[1]'
bus_seat_image = '(//img[@src="/bus-mmt-next/_next/image?url=%2Fbus-mmt-next%2FSleeper_Available.png&w=64&q=75"])[1]' #points to multiple images
pickup = '(//div[contains(@class, "makeFlex PickUpDrop")])[1]'
drop = '//div[text()="Drop Points"]//following::div[contains(@class, "makeFlex PickUpDropSelection")][1]'
continue_button = '//button[text()="Continue"]'
bus_name = '//div[@class="makeFlex spaceBetween appendBottom6 blackText"]/child::p[@class="latoBlack font18"]'
bus_price = '//div[contains(@class, "priceWrapper latoBold blackText")]/child::span'
input_page3 = "(//input)" #take first 4 respectively
female_gender_tab_page_3 = '(//div[@class="genderTab makeFlex"]/child::div)[2]' #first child is male tab and second female tab
confirm_checkbox_page_3 = '//input[@id="cb_gst_info"]'
# base_fare_page_3 = '//span[@class="paymentPrice"]'
# continue_button_page_3 = '//div[@class="paymentBtn whiteText latoBold font16 capText"]/child::span'
# title_of_cities_page_4 = '//span[@data-testid="lob-summary-title-text"]' #this used for last verification for cities
