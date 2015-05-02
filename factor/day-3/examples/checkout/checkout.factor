USING: accessors formatting.private kernel math math.parser sequences ;
IN: examples.checkout

TUPLE: cart-item name price quantity ;
TUPLE: checkout item-count base-price taxes shipping total-price ;

: <cart-item> ( name price quantity -- cart-item ) cart-item boa ;

: <cart-item-from-price> ( price -- cart-item )
  "DefaultName" swap 1 cart-item boa ;

: format-price ( price -- formatted ) 2 format-decimal string>number ;

: sum ( seq -- n ) 0 [ + ] reduce ;
: cart-item-count ( cart -- count ) [ quantity>> ] map sum ;
: cart-item-price ( cart-item -- price ) [ price>> ] [ quantity>> ] bi * ;
: cart-base-price ( cart -- price ) [ cart-item-price ] map sum ;

: <base-checkout> ( item-count base-price -- checkout )
  f f f checkout boa ;

: <checkout> ( cart -- checkout )
  [ cart-item-count ] [ cart-base-price ] bi <base-checkout> ;

CONSTANT: gst-rate 0.05
CONSTANT: pst-rate 0.09975

: gst-pst ( price -- taxes ) [ gst-rate * ] [ pst-rate * ] bi + ;

: nc-sales-tax ( price -- taxes ) 0.0475 * ;

: taxes ( checkout taxes-calc -- taxes )
  [ dup base-price>> ] dip
  call format-price >>taxes ; inline

CONSTANT: base-shipping 1.49
CONSTANT: per-item-shipping 1.00

: per-item ( item-count -- shipping ) per-item-shipping * base-shipping + ;

: free-shipping! ( item-count -- shipping ) drop 0 ;

: shipping ( checkout shipping-calc -- shipping )
  [ dup item-count>> ] dip
  call format-price >>shipping ; inline

: total ( checkout -- total-price ) dup
  [ base-price>> ] [ taxes>> ] [ shipping>> ] tri + + >>total-price ;

: sample-checkout ( checkout -- checkout )
  [ gst-pst ] taxes [ per-item ] shipping total ;

: discount ( cart-item percentage -- discounted )
  [ dup price>> dup ] dip * - format-price >>price ;

: checkout-pipeline ( checkout tax-calc shipping-calc -- checkout )
  [ taxes ] dip shipping total ; inline