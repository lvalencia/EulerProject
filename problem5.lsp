(format t "~A~%" (let ((x 11))
   (loop for i from 11 to 20 do
      (setq x (lcm x i))) x))
