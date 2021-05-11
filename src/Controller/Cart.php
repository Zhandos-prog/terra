<?php namespace Src\Controller;


use Core\Facade\Template;
use Core\Gateway\Subjects;
use Core\Service\Mail;
use Core\Service\Registry;
use Zend\Db\Sql\Select;

class Cart extends AbstractController
{
    public function bootRouting()
    {
        $this->GET('/', 'cartPage');
        $this->POST('/add','add');
        $this->POST('/remove','remove');
        $this->POST('/info', 'info');
        $this->POST('/change','change');
        $this->POST('/send','send');
    }

    public function send() {
        $message = Registry::get('http.request.body');
        $products = Registry::get('session.cart',[]);
        $emails = Subjects::of('Variable')->find(1);
        $emails = explode(",", $emails->value);
        if(count($emails)) {
            foreach($emails as $email) {
                $mail = (new Mail)->subject('Простая заявка')->body(Template::render('src/mail/simple-order', [
                    'products' => $products,
                    'message' => $message
                ]));
            }
        }

        Registry::set('session.cart',[]);

        return $this->json(['status'=>true]);
    }

    public function change() {
        $cart = Registry::get('session.cart');
        $request = Registry::get('http.request.body');
        $id = $request['id'];
        $count = $request['count'];
        $cart[$id]['count'] = $count;
        Registry::set('session.cart', $cart);
        return $this->html($cart[$id]['price'] * $count.' тг.');
    }

    public function info() {
        $cart = Registry::get('session.cart',[]);
        $count = 0;
        $sum = 0;
        if(count($cart))
        foreach($cart as $id=>$product) {
            $sum += $product['price'] * $product['count'];
            $count++;
        }
        return $this->json(['sum'=>$sum.' тг.','count'=>$count]);
    }

    public function cartPage() {
        $products = Registry::get('session.cart');
       // var_dump($products);
        //return $this->html('sdfdsf');
        return $this->html(Template::render('src/cart/index',['products'=>$products]));
    }

    public function add() {
        $request = Registry::get('http.request.body');
        $id = $request['id'];
        $count = $request['count'];
        $cart = Registry::get('session.cart');
        if(isset($cart[$id])) {
            return $this->text('3');
        }
        $product = Subjects::of('Product')->find($id);
        $cart[$id]  = [
            'reference'=>$product->reference,
            'name'=>$product->name,
            'price'=>$product->price,
            'count'=>$count,
            'image'=>$product->images()->first()->image,
            'id'=>$product->id,
            'link'=>$product->url()
        ];


        Registry::set('session.cart', $cart);

        return $this->html('1');
    }

    public function remove() {
        $request = Registry::get('http.request.body');
        $id = $request['id'];

        $cart = Registry::get('session.cart');
        unset($cart[$id]);

        Registry::set('session.cart', $cart);

        return $this->html('1');
    }

}