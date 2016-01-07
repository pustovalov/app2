module CardsHelper
  def find_card(id)
    if id
      current_user.cards.find(params[:id])
    else
      if current_user.current_block
        current_user.current_block.cards.pending.first || current_user.current_block.cards.repeating.first
      else
        current_user.cards.pending.first || current_user.cards.repeating.first
      end
    end
  end
end
