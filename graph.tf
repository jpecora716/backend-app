resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "828211b1-bfbb-437d-859e-c2eeb550744d"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "a13bb92d-f0c4-4418-a3c8-3ec331dce478"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "5ade9c5b-6d9e-4f7a-8841-05b871656bf9"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "27efc14c-f962-40f6-86ea-16658d6883c6"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "88ccbb7d-902a-4c50-8d58-1391da968357"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "7b291c55-d56a-4cf8-9372-5610db5b12b4"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "d17df053-8216-4e03-97f7-6b48db21d328"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "399cd239-e1a2-4eb7-8a62-9dbff1d00d84"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "92996f00-63ba-4ecc-9b0c-377ff3e41835"
  }
}