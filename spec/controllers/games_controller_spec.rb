require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:games) { create_list(:game, 10) }
  let(:game) { games.first }

  describe 'GET #index' do
    before { get :index }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns all games as @games' do
      expect(assigns(:games)).to eq(games)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: game.id } }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns the requested game as @game' do
      expect(assigns(:game)).to eq(game)
    end
  end

  describe 'POST #create' do
    let(:new_game_attributes) { attributes_for(:game) }

    context 'with valid params' do
      it 'creates a new Game' do
        expect {
          post :create, params: { game: new_game_attributes }
        }.to change(Game, :count).by(1)
      end

      it 'redirects to the created game' do
        post :create, params: { game: new_game_attributes }
        expect(response).to redirect_to(Game)
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) { attributes_for(:game) }

    context 'with valid params' do
      it 'updates the requested game' do
        put :update, params: { id: game.id, game: new_attributes }
        game.reload
        expect(game.name).to eq(new_attributes[:name])
      end

      it 'redirects to the game' do
        put :update, params: { id: game.id, game: new_attributes }
        expect(response).to redirect_to(game)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested game' do
      expect {
        delete :destroy, params: { id: game.id }
      }.to change(Game, :count).by(9)
    end

    it 'redirects to the games list' do
      delete :destroy, params: { id: game.id }
      expect(response).to redirect_to(games_url)
    end
  end
end
