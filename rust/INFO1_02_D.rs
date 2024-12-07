fn main() {
    let mut a = 10;
    let mut b = 20;
    println!("{} {}", a, b);

    let t = a;
    a = b;
    b = t;
    println!("{} {}", a, b);
}
