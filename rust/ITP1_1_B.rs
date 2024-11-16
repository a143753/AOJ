fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let dat = buf.trim().parse::<i32>().unwrap();

    let ans = dat * dat * dat;
    println!("{}", ans);
}
