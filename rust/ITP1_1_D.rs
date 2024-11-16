fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let dt = buf.trim().parse::<i32>().unwrap();
    println!("{}:{}:{}", dt / 3600, dt % 3600 / 60, dt % 60);
}
