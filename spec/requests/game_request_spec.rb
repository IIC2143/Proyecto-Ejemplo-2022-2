require 'rails_helper'

RSpec.describe Game, type: :request do
    
    before(:all) do
        @game = create(:game)
        @game.save
    end

    describe 'crear game' do
        it 'si tiene atributos válidos' do
            expect do
                post games_path, params: {
                    game: {
                        name: @game.name,
                        year: @game.year,
                        genre: @game.genre,
                        publisher: @game.publisher,
                        description: @game.description
                    }
                }
            end.to change(Game, :count).by(1)
        end

        it 'no funciona si tiene no tiene year válido' do
            expect do
                post games_path, params: {
                    game: {
                        name: @game.name,
                        year: -1,
                        genre: @game.genre,
                        publisher: @game.publisher,
                        description: @game.description
                    }
                }
            end.to change(Game, :count).by(0)
        end
    end

    describe 'actualizar game' do        
        it 'si nuevo year es válido' do
            patch game_path(@game), params: {
                game: {
                    name: @game.name,
                    year: 2020,
                    genre: @game.genre,
                    publisher: @game.publisher,
                    description: @game.description
                }
            }
            expect(Game.find(@game.id).year).to eq(2020)
        end

        it 'no funciona si nuevo genre no es válido' do
            patch game_path(@game), params: {
                game: {
                    name: @game.name,
                    year: 2020,
                    genre: "",
                    publisher: @game.publisher,
                    description: @game.description
                }
            }
            expect(Game.find(@game.id).genre).to eq(@game.genre)
        end
    end

    describe "delete game" do
        it "borra game si existe" do
            expect do
                delete game_path(@game)
            end.to change(Game, :count).by(-1)
        end
    end
end
