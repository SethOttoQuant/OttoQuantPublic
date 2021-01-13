OttoML <- function(keyval, training_data, observations, MF_weights = "none",
                   sd = 1, gp = 11, shape = 0){

  inputs <- list(
    keyval = keyval,
    training_data = training_data,
    observations = observations,
    MF_weights = MF_weights,
    sd = sd,
    gp = gp,
    shape = shape
  )

  req_body <- toJSON(inputs, dataframe = "columns")

  out <- httr::POST(url = "http://142.93.85.22:80/OttoML", body = req_body)
  res_out <- fromJSON(content(out, "text", encoding = "UTF-8"))
  return(res_out)

}

OttoBoot <- function(keyval, training_data,
                   sd = 1, gp = 11, shape = 0){

  inputs <- list(
    keyval = keyval,
    training_data = training_data,
    sd = sd,
    gp = gp,
    shape = shape
  )

  req_body <- toJSON(inputs, dataframe = "columns")

  out <- httr::POST(url = "http://142.93.85.22:80/OttoBoot", body = req_body)
  res_out <- fromJSON(content(out, "text", encoding = "UTF-8"))
  return(res_out)

}

GetLog <- function(keyval){
  out <- httr::GET(paste0("http://142.93.85.22:80/userlog?keyval=",keyval))
  res_out <- fromJSON(content(out, "text", encoding = "UTF-8"))
  return(res_out)
}

TestKey <- function(keyval){
  out <- httr::GET(paste0("http://142.93.85.22:80/testkey?keyval=",keyval))
  res_out <- fromJSON(content(out, "text", encoding = "UTF-8"))
  return(res_out)
}

OttoVersion <- function(keyval){
  out <- httr::GET("http://142.93.85.22:80/version")
  res_out <- fromJSON(content(out, "text", encoding = "UTF-8"))
  return(res_out)
}

