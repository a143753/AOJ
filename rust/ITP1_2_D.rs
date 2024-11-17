fn ans(w: i32, h: i32, x: i32, y: i32, r: i32) {
    if x - r >= 0 && x + r <= w && y - r >= 0 && y + r <= h {
        println!("Yes");
    } else {
        println!("No");
    }
}

fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();

    let dt = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect::<Vec<_>>();

    let (w, h, x, y, r) = (dt[0], dt[1], dt[2], dt[3], dt[4]);

    ans(w, h, x, y, r);
}
