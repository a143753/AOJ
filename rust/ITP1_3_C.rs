use std::io::BufRead;
fn main() {
    std::io::stdin().lock().lines().for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<_>>();
        let (x, y) = (dt[0], dt[1]);
        if x == 0 && y == 0 {
            return;
        }
        println!("{} {}", std::cmp::min(x, y), std::cmp::max(x, y));
    });
}
