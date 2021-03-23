function varargout = GUI_Floyd(varargin)
% GUI_FLOYD MATLAB code for GUI_Floyd.fig
%      GUI_FLOYD, by itself, creates a new GUI_FLOYD or raises the existing
%      singleton*.
%
%      H = GUI_FLOYD returns the handle to a new GUI_FLOYD or the handle to
%      the existing singleton*.
%
%      GUI_FLOYD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FLOYD.M with the given input arguments.
%
%      GUI_FLOYD('Property','Value',...) creates a new GUI_FLOYD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Floyd_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Floyd_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Floyd

% Last Modified by GUIDE v2.5 31-May-2019 15:05:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Floyd_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Floyd_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_Floyd is made visible.
function GUI_Floyd_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Floyd (see VARARGIN)

% Choose default command line output for GUI_Floyd
handles.output = hObject;

% Update handles structure
movegui(gcf, 'center');
itss=imread('its.png');
imshow(itss, 'Parent', handles.its);
mat=imread('mat.png');
imshow(mat, 'Parent', handles.math);
set(handles.loadedFN, 'enable', 'off');
set(handles.route, 'enable', 'off');
set(handles.res, 'enable', 'off');
guidata(hObject, handles);
clear all;clc
% UIWAIT makes GUI_Floyd wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Floyd_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.inNode, 'string', '');
set(handles.endNode, 'string', '');
set(handles.route, 'string', '');
set(handles.res, 'string', '');

[nama_file,nama_path]=uigetfile('*.xlsx', 'LOAD');
lnf=nama_file;
if ~isequal (nama_file, 0)
    files = fullfile(nama_path, nama_file);
    input = xlsread(files, 1, 'A2:C1000');
    set(handles.uitable1, 'Data', input(1:end,:))
    set(handles.loadedFN, 'string', lnf);
    global x;
    global y;
    global z;
    x = [];
    y = [];
    x = double(input(:,1));
    y = double(input(:,2));
    z = double(input(:,3));
    
    axes(handles.graphR);    
    global Gr;
    Gr = digraph(x,y,z);            
    p=plot(Gr, 'EdgeLabel', Gr.Edges.Weight, 'LineWidth', 1.5, 'NodeColor', 'k', 'MarkerSize', 7, 'ArrowSize', 10);                
    nodelbl = p.NodeLabel;
    p.NodeLabel = '';
    xd = get(p, 'XData');
    yd = get(p, 'YData');
    text(xd, yd, nodelbl, 'FontSize',15, 'FontWeight','bold', 'HorizontalAlignment','left', 'VerticalAlignment','bottom')
else
    return
end

function inNode_Callback(hObject, eventdata, handles)
% hObject    handle to inNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNode as text
%        str2double(get(hObject,'String')) returns contents of inNode as a double


% --- Executes during object creation, after setting all properties.
function inNode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endNode_Callback(hObject, eventdata, handles)
% hObject    handle to endNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endNode as text
%        str2double(get(hObject,'String')) returns contents of endNode as a double


% --- Executes during object creation, after setting all properties.
function endNode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endNode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Gr;
global x;
global y;
global z;

%exception handling for prevent some error that might be happend
try 
    %To overcome if the data is not exist / not loaded yet     
    if isempty(x) || isempty(y)     
        uiwait(msgbox("Load The Data First!", "Data Not Found", 'error','modal'))                      
        
    %To overcome if the initial and/or end node is empty / not fllled yet
    else 
        if isempty(get(handles.inNode,'string')) || isempty(get(handles.endNode,'string'))
            uiwait(msgbox("Input Initial Node and End Node First!", "Missing Input", 'error'))                     
        end
    end
    
    inN = str2num(get(handles.inNode, 'string'));
    endN = str2num(get(handles.endNode, 'string'));
    nodes = unique([x y]);
    
    %checking are the nodes that the user input is exist or not
    if ~ismember(inN, nodes) || ~ismember(endN, nodes)
        msg = sprintf('The node(s) is not exist \nTry to input other nodes');
        uiwait(msgbox(msg, "Error Input", 'error'))     
        set(handles.inNode, 'string', '');
        set(handles.endNode, 'string', '');
        cla(handles.graphR)       
        Gr = digraph(x,y,z);        
        p=plot(Gr, 'EdgeLabel', Gr.Edges.Weight, 'LineWidth', 1.5, 'NodeColor', 'k','MarkerSize', 7, 'ArrowSize', 10);            
        nodelbl = p.NodeLabel;
        p.NodeLabel = '';
        xd = get(p, 'XData');
        yd = get(p, 'YData');
        text(xd, yd, nodelbl, 'FontSize',15, 'FontWeight','bold', 'HorizontalAlignment','left', 'VerticalAlignment','bottom')
    end

    %Change 0 to inf in adjacency matrix
    A = adjacency(Gr, 'weighted');
    for i=1:length(A)
        for j=1:length(A)
            if A(i,j) == 0 && i~= j
                A(i,j) = inf;
            end
        end
    end
    
    %Calculate the graph with Floyd-Warshall Algorithm
    B = full(A);
    [dist, node, Routes] = FloydSPR(B, inN, endN);    

    %The result for the node that want to find its shortest path
    Res = dist(inN, endN); 
    Res = num2str(Res);
    set(handles.res, 'string', Res);
        
    %Plot & highlight the shortest path graph 
    handles.graphR
    p=plot(Gr, 'EdgeLabel', Gr.Edges.Weight, 'LineWidth', 1.5, 'NodeColor', 'k', 'MarkerSize', 7, 'ArrowSize', 10);            
    nodelbl = p.NodeLabel;
    p.NodeLabel = '';
    xd = get(p, 'XData');
    yd = get(p, 'YData');
    text(xd, yd, nodelbl, 'FontSize',15, 'FontWeight','bold', 'HorizontalAlignment','left', 'VerticalAlignment','bottom')
    
    %this code for setting the output between two nodes, does it have the
    %shortest path routes or not
    if str2num(Res) == inf        
        set(handles.route, 'string', 'No routes are not available')
    else        
        routes = '';
        for i = 1:length(Routes)
            routes = [routes num2str(Routes(i))];
            if i~=length(Routes)
                routes = [routes ' - '];
            end
        end
        highlight(p,Routes,'EdgeColor','g', 'NodeColor', 'r', 'LineWidth', 2, 'MarkerSize', 7, 'ArrowSize', 15)
        set(handles.route, 'string', routes)
    end    

catch Exception    
    set(handles.route, 'string', '');
    set(handles.res, 'string', '');
    return
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1, 'Data', {});
set(handles.loadedFN, 'string', '');
set(handles.inNode, 'string', '');
set(handles.endNode, 'string', '');
set(handles.route, 'string', '');
set(handles.res, 'string', '');
cla(handles.graphR)
clear all; clc;

function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double


% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function route_Callback(hObject, eventdata, handles)
% hObject    handle to route (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of route as text
%        str2double(get(hObject,'String')) returns contents of route as a double


% --- Executes during object creation, after setting all properties.
function route_CreateFcn(hObject, eventdata, handles)
% hObject    handle to route (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function loadedFN_Callback(hObject, eventdata, handles)
% hObject    handle to loadedFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of loadedFN as text
%        str2double(get(hObject,'String')) returns contents of loadedFN as a double


% --- Executes during object creation, after setting all properties.
function loadedFN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to loadedFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
