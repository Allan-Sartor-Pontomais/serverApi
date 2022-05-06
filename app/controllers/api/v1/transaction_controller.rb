module Api
  module V1
    class TransactionController < ApplicationController
      # Lista todas as transações 
      def index
        transactions = Transaction.all
        
        render json: { status: 'SUCCESS', message: 'Itens carregados', data: transactions }, status: :ok
      end

       # Lista por ID
      def show
				transaction = Transaction.find(params[:id])

				render json: {status: 'SUCCESS', message:'Itens carregados', data:transaction}, status: :ok
			end

      # Criar uma nova transações
			def create
				transaction = Transaction.new(transaction_params)
        
				if transaction.save
					render json: {status: 'SUCCESS', message:'Transação salva!', data:transaction}, status: :ok
				else
					render json: {status: 'ERROR', message:'Transação não foi salva!', data:transaction.erros}, status: :unprocessable_entity
				end
			end

      # Excluir transação
			def destroy
				transaction = Transaction.find(params[:id])

				transaction.destroy

				render json: {status: 'SUCCESS', message:'Transação não foi salva!', data:transaction}, status: :ok
			end

			# Atualizar transação
			def update
				transaction = Transaction.find(params[:id])

				if transaction.update(transaction_params)
					render json: {status: 'SUCCESS', message:'Transação atualizada!', data:transaction}, status: :ok
				else
					render json: {status: 'ERROR', message:'Transação não atualizada!', data:transaction.erros}, status: :unprocessable_entity
				end
			end


			# Parametros aceitos
			private

			def transaction_params
				params.permit(:title, :typing, :category, :amount)
			end


    end
  end
end