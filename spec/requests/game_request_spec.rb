require 'rails_helper'
include AuthHelper

RSpec.describe Game, type: :request do
    before(:each) do
        login_user
    end

    before(:all) do
        @game = create(:game)
        @game.save
    end

    describe 'POST /games' do
        it 'should create a game' do
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

        it 'should not create a game with invalid data' do
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

    describe 'PATCH /games/:id' do        
        it 'should update a game\'s year' do
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

        it 'should not update a game with invalid data' do
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

    describe "DELETE /games/:id" do
        it "should delete a game" do
            expect do
                delete game_path(@game)
            end.to change(Game, :count).by(-1)
        end
    end
end
