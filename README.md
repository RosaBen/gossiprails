# GossipProject
### step1
install gems with :
```bash
bundle install
```
### step2
create diagram of relations
[exodiagram](exo.drawio)

### step3
check status of migrations
```bash
rails db:migrate:status
```
#### is migration down?
DO
```bash
rails db:migrate
```
#### is migration up?
check schema.rb to check if all tables are created and their foreign keys
add seeds
```bash
rails db:seeds
```
### step4
access rails console
```bash
rails c
```
#### add new dog, new dogsitter, new city
```bash
City.create!(city_name: "Wonderland")
DogSitter.create!(last_name: "louis", first_name:"rosa", phone_number:"07 04 02 05 07", city_id: 1)
Dog.create!(name: "Fanfan", city_id: 1)
Stroll.create!(dog_id: 1 , dog_sitter_id: 1)
```
#### check All classes
enter tp + Class.all
Ex:
```bash
tp Doctor.all
```