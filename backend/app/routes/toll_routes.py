from datetime import datetime 
 
toll_bp = Blueprint('toll', __name__) 
 
@toll_bp.route('/process_toll', methods=['POST']) 
def process_toll(): 
    user_id = request.json.get('user_id') 
    toll_amount = request.json.get('toll_amount') 
 
    transaction = TollTransaction( 
        user_id=user_id, 
        toll_amount=toll_amount, 
        timestamp=datetime.utcnow() 
    ) 
 
    db.session.add(transaction) 
    db.session.commit() 
 
    return jsonify({'message': 'Toll processed successfully', 'transaction_id': transaction.id}), 201 
