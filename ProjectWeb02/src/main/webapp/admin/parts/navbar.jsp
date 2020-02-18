<%@ page import="vn.nlu.fit.utils.Util" %><%--
  Created by IntelliJ IDEA.
  User: Minh Hung Tran
  Date: 19/12/2019
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--Toast--%>
<style>
    #toastParent2 {
        /*display: flex !important;*/
        display: none;
        align-items: center;
        justify-content: center;
        position: fixed;
        left: 0;
        top: 0;
        width: 100vw;
        height: 100vh;
        padding-right: 17px;
        overflow-x: hidden;
        overflow-y: auto;
        z-index: 1050;
        outline: 0;
        visibility: hidden;


    }

    #toast2 {
        display: flex !important;
        align-items: center;
        justify-content: center;
        min-width: 250px;
        min-height: 100px;
        background-color: #000000b3;
        color: #fff;
        border-radius: 2px;
        padding: 16px;
        font-size: 18px;
    }

    #toast2.danger {
        background: #fdecea;
        border: 1px solid #f44336;
        color: black;
        border-radius: unset;
        box-shadow: 2px 2px 4px #0000006e;
    }

    #toast2.danger i {
        color: #f44336;
    }

    #toast2.success {
        background: #51a351;
        opacity: 0.9;
        border: 1px solid #13691e;
        color: white;
        border-radius: unset;
        box-shadow: 2px 2px 4px #0000006e;
    }

    #toast2.success i {
        color: white;
    }

    #toastParent2.show {
        display: flex !important;
        visibility: visible;
        /*-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;*/
        /*animation: fadein 0.5s, fadeout 0.5s 2.5s;*/
        animation: scale 0.1s, scaleout 0.5s 2.5s;;
        /*transition: transform .2s;*/

    }

    @keyframes scale {
        0% {
            transform: scale(1.0)
        }
        10% {
            transform: scale(1.05)
        }
        20% {
            transform: scale(1.10)
        }
        30% {
            transform: scale(1.15)
        }
        40% {
            transform: scale(1.20)
        }
        50% {
            transform: scale(1.20)
        }
        60% {
            transform: scale(1.20)
        }
        70% {
            transform: scale(1.15)
        }
        80% {
            transform: scale(1.10)
        }
        90% {
            transform: scale(1.05)
        }
        100% {
            transform: scale(1.00)
        }
    }

    @keyframes scaleout {
        from {
            transform: scale(1.00);
            opacity: 1;
        }
        to {
            transform: scale(0);
            opacity: 0;
        }
    }

    @-webkit-keyframes fadein {
        from {
            top: -50px;
            opacity: 0;
        }
        to {
            top: 0;
            opacity: 1;
        }
    }

    @keyframes fadein {
        from {
            top: -50px;
            opacity: 0;
        }
        to {
            top: 0;
            opacity: 1;
        }
    }

    @-webkit-keyframes fadeout {
        from {
            top: 0;
            opacity: 1;
        }
        to {
            top: -50px;
            opacity: 0;
        }
    }

    @keyframes fadeout {
        from {
            top: 0;
            opacity: 1;
        }
        to {
            top: -50px;
            opacity: 0;
        }
    }
</style>
<div id="toastParent2">
    <div id="toast2">

    </div>
</div>


<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a href="<%=Util.fullPathAdmin("product/list")%>" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    DHT Admin
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <li class="green dropdown-modal">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success">5</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-envelope-o"></i>
                            5 Messages
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar">
                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="<%=Util.fullPathAdmin("assets/images/avatars/avatar.png")%>"
                                             class="msg-photo"
                                             alt="Alex's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">Alex:</span>
														Ciao sociis natoque penatibus et auctor ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>a moment ago</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="<%=Util.fullPathAdmin("assets/images/avatars/avatar3.png")%>"
                                             class="msg-photo"
                                             alt="Susan's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">Susan:</span>
														Vestibulum id ligula porta felis euismod ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 minutes ago</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="<%=Util.fullPathAdmin("assets/images/avatars/avatar4.png")%>"
                                             class="msg-photo"
                                             alt="Bob's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">Bob:</span>
														Nullam quis risus eget urna mollis ornare ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>3:15 pm</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="<%=Util.fullPathAdmin("assets/images/avatars/avatar2.png")%>"
                                             class="msg-photo"
                                             alt="Kate's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">Kate:</span>
														Ciao sociis natoque eget urna mollis ornare ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>1:33 pm</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="<%=Util.fullPathAdmin("assets/images/avatars/avatar5.png")%>"
                                             class="msg-photo"
                                             alt="Fred's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">Fred:</span>
														Vestibulum id penatibus et auctor  ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>10:09 am</span>
													</span>
												</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="inbox.html">
                                See all messages
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="<%=Util.fullPathAdmin("assets/images/avatars/user.jpg")%>"
                             alt="Jason's Photo"/>
                        <span class="user-info">
									<small>Welcome,</small>
									Jason
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="ace-icon fa fa-cog"></i>
                                Settings
                            </a>
                        </li>

                        <li>
                            <a href="profile.html">
                                <i class="ace-icon fa fa-user"></i>
                                Profile
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="#">
                                <i class="ace-icon fa fa-power-off"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.navbar-container -->
</div>
<%--Toast--%>
